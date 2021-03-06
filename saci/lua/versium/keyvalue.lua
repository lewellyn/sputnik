-----------------------------------------------------------------------------
-- Implements Versium API over a generic key-value storage system.
--
-- (c) 2009  Yuri Takhteyev (yuri@freewisdom.org)
-- License: MIT/X, see http://sputnik.freewisdom.org/en/License
-----------------------------------------------------------------------------

module(..., package.seeall)
local util = require("versium.util")
local errors = require("versium.errors")

-----------------------------------------------------------------------------
-- A table that describes what this versium implementation can and cannot do.
-----------------------------------------------------------------------------
capabilities = {
   can_save = true,
   has_history = true,
   is_persistent = true,
   supports_extra_fields = true,
}


-- A template used for generating the index file.
local INDEX_TEMPLATE=[[add_version{
version   = %q,
timestamp = %q,
author    = %q,
comment   = %q,%s
}
]]

-----------------------------------------------------------------------------
-- A table representing the class.
-----------------------------------------------------------------------------
local KeyValueVersium = {}

-- And it's metatable
local KeyValueVersium_mt = {__metatable={}, __index=KeyValueVersium}

-----------------------------------------------------------------------------
-- Instantiates a new KeyValueVersium object that represents a connection to
-- a storage system.  This is the only function that this module exports.
-- 
-- @param params         a table of params (we expect to find as the first
--                       entry the path to the directory where we'll be
--                       storing the data.
-- @return               a new versium object.
-----------------------------------------------------------------------------
function new(params)
   assert(params.get and type(params.get)=="function",
          "need a function as the 'get' param")
   assert(params.set and type(params.set)=="function",
          "need a function as the 'set' param")
   local new_versium = {get_fn=params.get, set_fn=params.set, node_table={}}
   local new_versium = setmetatable(new_versium, KeyValueVersium_mt)
   return new_versium 
end


--x--------------------------------------------------------------------------
-- Parses raw history file into a table, filters by timestamp prefix.
-----------------------------------------------------------------------------
local function parse_history(raw_history, date_prefix, limit)
   date_prefix = date_prefix or ""
   local preflen = date_prefix:len()
   local f = loadstring(raw_history)
   local all_versions = {}
   local counter = 0
   local environment = {
      add_version = function (values)
                       if not limit or counter <= limit then
                          if values.timestamp:sub(1, preflen) == date_prefix then 
                             table.insert(all_versions, values)
                             counter = counter + 1
                          end
                       end
                    end 
   }
   setfenv(f, environment)
   f()
   return all_versions
end


function KeyValueVersium:get(key)
   return self.get_fn(key)
end

function KeyValueVersium:set(key, value)
   return self.set_fn(key, value)
end

-----------------------------------------------------------------------------
-- Returns the data stored in the node as a string and a table representing
-- the node's metadata.  Returns nil if the node doesn't exist.  Throws an
-- error if anything else goes wrong.
--
-- @param id             a node id.
-- @param version        [optional] the desired version of the node (defaults
--                       to latest).
-- @return               a byte-string representing the data stored in the
--                       node or nil if the node could not be loaded or nil.
-- @see get_node_history
-----------------------------------------------------------------------------
function KeyValueVersium:get_node(id, version)
   assert(id)
   if not self:node_exists(id) then
      return nil
   end
   local metadata = self:get_node_info(id, version)
   assert(metadata.version) -- should come from history
   local key = id.."/"..metadata.version
   local data = self:get(key)
   assert(data)
   return data
end

-----------------------------------------------------------------------------
-- Returns true if the node with this id exists and false otherwise.
-- 
-- @param id             a node id.
-- @return               true or false.
-----------------------------------------------------------------------------
function KeyValueVersium:node_exists(id)
   return self:get(id.."/index") ~= nil
end

-----------------------------------------------------------------------------
-- Returns a table with the metadata for the latest version of the node. Same
-- as get_node_history(id)[1] in case of this implementation.
-- 
-- @param id             a node id.
-- @param version        [optional] the desired version of the node (defaults
--                       to latest).
-- @return               the metadata for the latest version (see 
--                       get_node_history()).
-- @see get_node_history
-----------------------------------------------------------------------------
function KeyValueVersium:get_node_info(id, version)
   assert(id)
   local history
   if not version then 
      history = self:get_node_history(id, nil, 1) or {}
   else
      history = self:get_node_history(id) or {}
   end
   if not #history==0 then return nil end

   if version then
      for i, commit in ipairs(history) do
         if commit.version == version then
            return commit
         end
      end
   else
      return history[1] -- i.e., the _latest_ version
   end
end

-----------------------------------------------------------------------------
-- Returns a list of existing node ids, up to a certain limit.  (If no limit
-- is specified, all ids are returned.)  The ids can be optionally filtered
-- by prefix.  (In this case, the limit applies to the number of ids that
-- are being _returned_.)  The ids can be returned in any order.
--
-- @param prefix         [optional] a prefix to filter the ids (defaults to
--                       "").
-- @param limit          [optional] the maximum number of ids to return.
-- @return               a list of node ids.
-- @return               true if there are more ids left.
-----------------------------------------------------------------------------
function KeyValueVersium:get_node_ids(prefix, limit)
   if true then return {} end
   local ids = {}
   local counter = 0
   prefix = prefix or ""
   local preflen = prefix:len()
   for id, _ in pairs(self.node_table) do
      if id:sub(1, preflen) == prefix then
         if counter == limit then
            return ids, true
         else
            table.insert(ids, id)
            counter = counter + 1
         end
      end
   end
   return ids
end

-----------------------------------------------------------------------------
-- Saves a new version of the node.
--
-- @param id             the id of the node.
-- @param data           the value to save ("" is ok).
-- @param author         the user name to be associated with the change.
-- @param comment        [optional] the change comment.
-- @param extra          [optional] a table of additional metadata.
-- @param timestamp      [optional] a timestamp to use.
-- @return               the version id of the new node.
-----------------------------------------------------------------------------
function KeyValueVersium:save_version(id, data, author, comment, extra, timestamp)
   assert(id)
   assert(data)
   assert(author)
   -- load history, figure out the new revision ID, save the data
   local raw_history = self:get(id.."/index") or ""
   local history = parse_history(raw_history)
   local new_version_id = string.format("%06d", #history + 1)
   self:set(id.."/"..new_version_id, data)
   -- generate and save the new index
   timestamp = timestamp or os.date("!%Y-%m-%d %H:%M:%S") -- default to current time   
   local extra_buffer = ""
   for k,v in pairs(extra or {}) do
      extra_buffer = extra_buffer..string.format("\n [%q] = %q, ", k, v)
   end                                
   local new_history = string.format(INDEX_TEMPLATE, 
                                     new_version_id, timestamp, author, 
                                     comment or "", extra_buffer) 
   self:set(id.."/index", new_history..raw_history)
   return new_version_id
end

-----------------------------------------------------------------------------
-- Returns the history of the node as a list of tables.  Each table
-- represents a revision of the node and has the following fields:
-- "version" (the id of the revision), "author" (the author who made the
-- revision), "comment" (the comment attached to the revision or nil), 
-- "extra" (a table of additional fields or nil).  The history can be
-- filtered by a time prefix.  Returns an empty table if the node does not
-- exist.
--
-- @param id             the id of the node.
-- @param date_prefix    time prefix.
-- @param limit          the max number of history items to return
-- @return               a list of tables representing the versions (the list
--                       will be empty if the node doesn't exist).
-----------------------------------------------------------------------------
function KeyValueVersium:get_node_history(id, date_prefix, limit)
   assert(id)
   if not self:node_exists(id) then return nil end

   local raw_history = self:get(id.."/index") or ""
   assert(raw_history:len() > 0, "Empty history for node '"..id.."'.")
   return parse_history(raw_history, date_prefix, limit)
end

