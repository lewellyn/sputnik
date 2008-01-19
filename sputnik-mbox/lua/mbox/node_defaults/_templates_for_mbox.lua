title="Templates:MBox"
summary="The default version"
prototype="@Lua_Config"
content=[=========[


THREAD = [====[

<div width='100%'>

 <style>
  .email_from {
    font-size: 200%;
  }
  .email_address {
    font-family: monospace;
  }
  .email_date {
    font-size: 140%;
    color: #333;
  }
  .email_message pre {
    border: none;
    background: white;
  }
  .email_message code {
    font-size: 100%;
    background: white;
  }
  .email_message {

  }
  .email_attachment {
    padding: 3 3 3 3;
    margin-left: 20px;    
  }
  .email_header {
    width: 100%;
    border: 1px solid orange;
    background: #eee;
    margin: 0 0 0 0;
    padding: 3 3 3 15;
  }

  blockquote {
    border-left: 2px solid #ddd;
    margin-left: 10px;
    padding-left: 10px;
  }
 </style>
  
 $do_messages[=[
     <div class="email_message">
      <div class="email_header">
       <span class="email_from">$name</span>&nbsp;
       <span class="email_date">on $date</span><br/>
       <span class="email_address">&lt;$email&gt;</span>


       $do_attachments[[
	  <div class="email_attachment">
            Attachment: <a href="$url">$name</a> ($size)
          </div>
       ]]      
      </div>
       $body
  
       <br/>
     </div>
   ]=]

</div>

$after
]====]
]=========]
