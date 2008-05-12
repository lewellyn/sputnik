module(..., package.seeall)

NODE = {

 prototype= "@JavaScript",
 title= "Markitup - JQuery Editor Component",
}

NODE.content = [====[
// ----------------------------------------------------------------------------
// markItUp! Universal MarkUp Engine, JQuery plugin
// v 1.0.3 beta
// Dual licensed under the MIT and GPL licenses.
// ----------------------------------------------------------------------------
// Copyright (C) 2007-2008 Jay Salvat
// http://markitup.jaysalvat.com/
// ----------------------------------------------------------------------------
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(3($){$.3c.X=3(f,g){v k,u,z,I;u=z=I=s;k={1W:"",1S:q,2y:q,1w:"",2r:"3D-8",1Y:"",2c:"",27:"",1q:"",1Z:"1X",1x:"",1z:"",1C:{},1u:{},1n:{},1K:{},2x:[{}]};$.Q(k,f,g);m L.1G(3(){v d,p,V,w,N,6,K,F,H,1b,1a,J;d=$(L);p=L;V=[];w=s;N=0;6=0;K=-1;3 29(){d.1p(\'<1U C="\'+k.1W+\'"></1U>\');d.1p(\'<D 1l="\'+(d.2u("1l")||"")+\'" C="X"></D>\');d.1p(\'<D C="2G"></D>\');d.2u("1l","").1P("2E");1b=$(\'<D C="2D"></D>\').2B(d);$(1J(k.2x)).1I(1b);2v=$(\'<D C="3I"></D>\').1F(d).1c("3G",3(e){v h=d.2s(),y=e.2q,1g,1i;1g=3(e){d.1A("2s",3z.3w(20,e.2q+h-y)+"3v")};1i=3(e){$("Y").2k("2j",1g).2k("2h",1i)};$("Y").1c("2j",1g).1c("2h",1i)});1a=$(\'<D C="3r"></D>\').1F(d);1a.2e(2v);d.1V(1t).3l(1t);d.1c("1s",3(e,a){2(a.1m!==s){14()}2(p===$.X.22){S(a)}});d.Z(3(){$.X.22=L})}3 1J(b){v c=$("<12></12>"),i=0;$("E:2a > 12",c).1A("2X","o");$(b).1G(3(){v a=L,t="",U,E,j;U=(a.1B)?" [2P+"+a.1B+"]":"";2(a.2p){E=$(\'<E C="2K">\'+(a.2p||"")+\'</E>\').1I(c)}l{i++;1R(j=V.4-1;j>=0;j--){t+=V[j]+"-"}E=$(\'<E C="\'+(a.2F||"")+\' 1Q 1Q\'+t+(i)+\'"><a 1o="#" 1O="\'+(a.1B||"")+\'" U="\'+(a.1N+U||"")+\'">\'+(a.1N||"")+\'</a></E>\').26(3(e){2(a.1M){2C(a.1M)()}S(a);m s}).2a(3(){$("> 12",L).1L()},3(){$("> 12",L).2A()}).1I(c);2(a.2z){V.3M(i);$(E).1P("3L").2e(1J(a.2z))}}});V.3K();m c}3 2w(c){2(c){c=c.3J();c=c.1d(/\\(\\!\\((.*?)\\)\\!\\)/1H,3(x,a){v b=a.1E("|!|");2(I===q){m(b[1]!==2t)?b[1]:b[0]}l{m(b[1]===2t)?"":b[0]}});c=c.1d(/\\[\\!\\[(.*?)\\]\\!\\]/1H,3(a){v b=a.1d(/(\\[\\!\\[|\\]\\!\\])/1H,"").1E(":!:");m 3H(b[0],(b[1])?b[1]:"")||""});m c}m""}3 B(a){2($.3F(a)){a=a(H)}m 2w(a)}3 15(a){A=B(F.A);R=B(F.R);T=B(F.T);M=B(F.M);2(T!==""){o=A+T+M}l 2(5===""&&R!==""){o=A+R+M}l{o=A+(a||5)+M}m{o:o,A:A,T:T,R:R,M:M}}3 S(a){v b,j,n,i;H=F=a;14();$.Q(H,{1h:"",1k:p,5:(5||""),R:a.R,6:6,N:N});B(k.1x);B(F.1x);2(u===q&&z===q){B(F.3E)}$.Q(H,{1h:1});2(u===q&&z===q){P=5.1E((($.1f.3C)?"\\n":"\\r\\n"));1R(j=0,n=P.4,i=0;i<n;i++){2($.3A(P[i])!==""){$.Q(H,{1h:++j,5:P[i]});P[i]=15(P[i]).o}l{P[i]=""}}7={o:P.3y("\\n")};W=6;b=7.o.4+(($.1f.2n)?n:0)}l 2(u===q){7=15(5);W=6+7.A.4;b=7.o.4-7.A.4-7.M.4}l 2(z===q){7=15(5);W=6;b=7.o.4}l{7=15(5);W=6+7.o.4;b=0}2((5===""&&7.T==="")){2($.1f.2n){6+=(7.o.4-7.o.1d(/^\\n*/g,"").4)}W=6+7.A.4;b=7.o.4-7.A.4-7.M.4;K=d.G().1e(6,d.G().4).4}$.Q(H,{6:6,N:N});2(7.o!==5){2m(7.o);1y(W,b)}14();$.Q(H,{1h:"",5:5});2(u===q&&z===q){B(F.3u)}B(F.1z);B(k.1z);2(w&&J&&k.2y){2l()}}3 2m(a){2(O.5){v b=O.5.1v();b.16=a}l{d.G(d.G().1e(0,6)+a+d.G().1e(6+5.4,d.G().4))}}3 1y(a,b){2(p.2i){11=p.2i();11.3s(q);11.2g("1r",a);11.3q("1r",b);11.3p()}l 2(p.2d){p.2d(a,a+b)}p.2b=N;p.Z()}3 14(){p.Z();N=p.2b;2(O.5){5=O.5.1v().16;2($.1f.3o){v a=O.5.1v(),18=a.3m();18.3k(p);6=-1;3i(18.3h(a)){18.2g("1r");6++}}l{6=p.28}}l{6=p.28;5=d.G().1e(6,p.3g)}m 5}3 25(){2(!w){2(k.1S===q){w=$(\'<24 C="3f"></24>\').1F(1a).1L();J=w[w.4-1].3e||3d[w.4-1]}l{J=3b.23("","25","3a=21, 39=21")}}l{2(I&&w){w.38();w=s;J=s}}}3 2l(){v b;2(k.1q!==""){$.37({19:"36",35:s,34:k.1q,1X:k.1Z+"="+3j(d.G()),33:3(a){b=a},32:3(){31("X! 3n: 30 2Z 2Y.")}})}l{b=\'<Y>\\n<2o>\\n<2W 3t-2V="2f-19" 2f="16/Y; 2U=\'+k.2r+\'">\\n<U></U>\\n\';2(k.1w!==""){b+=\'<2T 1o="\'+k.1w+\'" />\\n\'}b+=\'<2S 1o="\'+k.1Y+\'" 3x="2R" 19="16/1A">\\n</2o>\\n\';b+=\'<1T 1l="\'+k.2c+\'" C="\'+k.27+\'">\\n\'+d.G()+\'\\n</1T>\\n\';b+=\'</Y>\'}J.O.23();J.O.2Q(b);3B(3(){J.O.2O()},2N);2(w===s){J.Z()}}3 1t(e){z=e.z;I=e.I;u=(!(e.I&&e.u))?e.u:s;$.Q(H,{u:u,z:z,I:I});2(e.19==="1V"){2(u){v a=$("a[1O="+2M.2L(e.17)+"]",1b);2(a.4!==0){u=s;a.2J("E").1D("26");e.2I();e.2H();m s}}2(e.17===13||e.17===10){2(u===q){u=s;S(k.1n);m k.1n.1j}l 2(z===q){z=s;S(k.1u);m k.1u.1j}l{S(k.1C);m k.1C.1j}}2(e.17===9){2(K!==-1){14();K=d.G().4-K;1y(K,0);K=-1;m s}l{S(k.1K);K=-1;m k.1K.1j}}}}29()})};$.X=3(a){v b={1m:s};$.Q(b,a);2(b.1m){m $(b.1m).1G(3(){$("1k",L).Z();$("1k",L).1D("1s",[b])})}l{$("1k").1D("1s",[b])}}})(3N);',62,236,'||if|function|length|selection|caretPosition|string||||||||||||||else|return||block|textArea|true||false||ctrlKey|var|iFrame|||shiftKey|openWith|prepare|class|div|li|clicked|val|hash|altKey|win|caretOffset|this|closeWith|scrollPosition|document|lines|extend|placeHolder|markup|replaceWith|title|levels|start|markItUp|html|focus||range|ul||get|build|text|keyCode|rangeCopy|type|footer|header|bind|replace|substring|browser|mouseMove|line|mouseUp|keepDefault|textarea|id|target|onCtrlEnter|href|wrap|previewParserPath|character|insertion|keyPressed|onShiftEnter|createRange|previewBaseUrl|beforeInsert|set|afterInsert|css|key|onEnter|trigger|split|insertAfter|each|gm|appendTo|dropMenus|onTab|show|call|name|accesskey|addClass|markItUpButton|for|previewIFrame|body|span|keydown|nameSpace|data|previewCssPath|previewParserVar||yes|focused|open|iframe|preview|click|previewBodyClassName|selectionStart|init|hover|scrollTop|previewBodyId|setSelectionRange|append|content|moveStart|mouseup|createTextRange|mousemove|unbind|refreshPeview|insert|opera|head|separator|clientY|previewCharset|height|undefined|attr|resizeHandle|magicMarkups|markupSet|previewIFrameRefresh|dropMenu|hide|insertBefore|eval|markItUpHeader|markItUpEditor|className|markItUpContainer|stopPropagation|preventDefault|parent|markItUpSeparator|fromCharCode|String|100|close|Ctrl|write|stylesheet|link|base|charset|equiv|meta|display|found|not|Parser|alert|error|success|url|async|POST|ajax|remove|scrollbars|resizable|window|fn|frame|contentWindow|markItUpPreviewFrame|selectionEnd|inRange|while|escape|moveToElementText|keyup|duplicate|Error|msie|select|moveEnd|markItUpFooter|collapse|http|afterMultiInsert|px|max|rel|join|Math|trim|setTimeout|mozilla|utf|beforeMultiInsert|isFunction|mousedown|prompt|markItUpResizeHandle|toString|pop|markItUpDropMenu|push|jQuery'.split('|'),0,{}))
]====]
