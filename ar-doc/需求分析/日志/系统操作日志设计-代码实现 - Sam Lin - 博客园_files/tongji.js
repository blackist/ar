/*
 *
 * This code is data acquisition code for www.linezing.com web traffic analysis platform.
 * www.linezing.com is Taobao's website.
 */

function lz_encode(str)
{
	var e = "", i = 0;

	for(i=0;i<str.length;i++) {
		if(str.charCodeAt(i)>=0&&str.charCodeAt(i)<=255) {
			e = e + escape(str.charAt(i));
		}
		else {
			e = e + str.charAt(i);
		}
	}

	return e;
}

function lz_get_screen()
{
	var c = "";

	if (self.screen) {
		c = screen.width+"x"+screen.height;
	}

	return c;
}

function lz_get_color()
{
	var c = ""; 

	if (self.screen) {
		c = screen.colorDepth+"-bit";
	}

	return c;
}

function lz_get_language()
{
	var l = "";
	var n = navigator;

	if (n.language) {
		l = n.language.toLowerCase();
	}
	else
	if (n.browserLanguage) {
		l = n.browserLanguage.toLowerCase();
	}

	return l;
}
 
function lz_get_agent()
{
	var a = "";
	var n = navigator;

	if (n.userAgent) {
		a = n.userAgent;
	}

	return a;
}

function lz_get_jvm_enabled()
{
	var j = "";
	var n = navigator;

	j = n.javaEnabled() ? 1 : 0;

	return j;
}

function lz_get_cookie_enabled()
{
	var c = "";
	var n = navigator;
	c = n.cookieEnabled ? 1 : 0;

	return c;
}

function lz_get_flash_ver()
{
	var f="",n=navigator;

	if (n.plugins && n.plugins.length) {
		for (var ii=0;ii<n.plugins.length;ii++) {
			if (n.plugins[ii].name.indexOf('Shockwave Flash')!=-1) {
				f=n.plugins[ii].description.split('Shockwave Flash ')[1];
				break;
			}
		}
	}
	else
	if (window.ActiveXObject) {
		for (var ii=10;ii>=2;ii--) {
			try {
				var fl=eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."+ii+"');");
				if (fl) {
					f=ii + '.0';
					break;
				}
			}
			 catch(e) {}
		}
	}
	return f;
} 

function lz_get_app()
{
	var a = "";
	var n = navigator;

	if (n.appName) {
		a = n.appName;
	}
	return a; 
}
 
function lz_c_ctry_top_domain(str)
{
	var pattern = "/^aero$|^cat$|^coop$|^int$|^museum$|^pro$|^travel$|^xxx$|^com$|^net$|^gov$|^org$|^mil$|^edu$|^biz$|^info$|^name$|^ac$|^mil$|^co$|^ed$|^gv$|^nt$|^bj$|^hz$|^sh$|^tj$|^cq$|^he$|^nm$|^ln$|^jl$|^hl$|^js$|^zj$|^ah$|^hb$|^hn$|^gd$|^gx$|^hi$|^sc$|^gz$|^yn$|^xz$|^sn$|^gs$|^qh$|^nx$|^xj$|^tw$|^hk$|^mo$|^fj$|^ha$|^jx$|^sd$|^sx$/i";

	if(str.match(pattern)){ return 1; }

	return 0;
}

function lz_c_ctry_domain(str)
{
	var pattern = "/^ac$|^ad$|^ae$|^af$|^ag$|^ai$|^al$|^am$|^an$|^ao$|^aq$|^ar$|^as$|^at$|^au$|^aw$|^az$|^ba$|^bb$|^bd$|^be$|^bf$|^bg$|^bh$|^bi$|^bj$|^bm$|^bo$|^br$|^bs$|^bt$|^bv$|^bw$|^by$|^bz$|^ca$|^cc$|^cd$|^cf$|^cg$|^ch$|^ci$|^ck$|^cl$|^cm$|^cn$|^co$|^cr$|^cs$|^cu$|^cv$|^cx$|^cy$|^cz$|^de$|^dj$|^dk$|^dm$|^do$|^dz$|^ec$|^ee$|^eg$|^eh$|^er$|^es$|^et$|^eu$|^fi$|^fj$|^fk$|^fm$|^fo$|^fr$|^ly$|^hk$|^hm$|^hn$|^hr$|^ht$|^hu$|^id$|^ie$|^il$|^im$|^in$|^io$|^ir$|^is$|^it$|^je$|^jm$|^jo$|^jp$|^ke$|^kg$|^kh$|^ki$|^km$|^kn$|^kp$|^kr$|^kw$|^ky$|^kz$|^la$|^lb$|^lc$|^li$|^lk$|^lr$|^ls$|^lt$|^lu$|^lv$|^ly$|^ga$|^gb$|^gd$|^ge$|^gf$|^gg$|^gh$|^gi$|^gl$|^gm$|^gn$|^gp$|^gq$|^gr$|^gs$|^gt$|^gu$|^gw$|^gy$|^ma$|^mc$|^md$|^mg$|^mh$|^mk$|^ml$|^mm$|^mn$|^mo$|^mp$|^mq$|^mr$|^ms$|^mt$|^mu$|^mv$|^mw$|^mx$|^my$|^mz$|^na$|^nc$|^ne$|^nf$|^ng$|^ni$|^nl$|^no$|^np$|^nr$|^nu$|^nz$|^om$|^re$|^ro$|^ru$|^rw$|^pa$|^pe$|^pf$|^pg$|^ph$|^pk$|^pl$|^pm$|^pr$|^ps$|^pt$|^pw$|^py$|^qa$|^wf$|^ws$|^sa$|^sb$|^sc$|^sd$|^se$|^sg$|^sh$|^si$|^sj$|^sk$|^sl$|^sm$|^sn$|^so$|^sr$|^st$|^su$|^sv$|^sy$|^sz$|^tc$|^td$|^tf$|^th$|^tg$|^tj$|^tk$|^tm$|^tn$|^to$|^tp$|^tr$|^tt$|^tv$|^tw$|^tz$|^ua$|^ug$|^uk$|^um$|^us$|^uy$|^uz$|^va$|^vc$|^ve$|^vg$|^vi$|^vn$|^vu$|^ye$|^yt$|^yu$|^za$|^zm$|^zr$|^zw$/i";

	if(str.match(pattern)){ return 1; }

	return 0;
}

function lz_get_domain(host)
{
	var d=host.replace(/^www\./, "");

	var ss=d.split(".");
	var l=ss.length;

	if(l == 3){
		if(lz_c_ctry_top_domain(ss[1]) && lz_c_ctry_domain(ss[2])){
		}
		else{
			d = ss[1]+"."+ss[2];
		}
	}
	else if(l >= 3){

		var ip_pat = "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$";

		if(host.match(ip_pat)){
			return d;
		}

		if(lz_c_ctry_top_domain(ss[l-2]) && lz_c_ctry_domain(ss[l-1])) {
			d = ss[l-3]+"."+ss[l-2]+"."+ss[l-1];
		}
		else{
			d = ss[l-2]+"."+ss[l-1];
		}
	}
		
	return d;
}

function lz_get_cookie(name)
{
	var mn=name+"=";
	var b,e;
	var co=document.cookie;

	if (mn=="=") {
		return co;
	}

	b=co.indexOf(mn);

	if (b < 0) {
		return "";
	}

	e=co.indexOf(";", b+name.length);

	if (e < 0) {
		return co.substring(b+name.length + 1);
	}
	else {
		return co.substring(b+name.length + 1, e);
	}
}
 
function lz_set_cookie(name, val, cotp) 
{ 
	var date=new Date; 
	var year=date.getFullYear(); 
	var hour=date.getHours(); 

	var cookie="";

	if (cotp == 0) { 
		cookie=name+"="+val+";"; 
	} 
	else if (cotp == 1) { 
		year=year+10; 
		date.setYear(year); 
		cookie=name+"="+val+";expires="+date.toGMTString()+";"; 
	} 
	else if (cotp == 2) { 
		hour=hour+1; 
		date.setHours(hour); 
		cookie=name+"="+val+";expires="+date.toGMTString()+";"; 
	} 

	var d=lz_get_domain(document.domain);
	if(d != ""){
		cookie +="domain="+d+";";
	}
	cookie +="path="+"/;";

	document.cookie=cookie;
}

function str_reverse(str) {
	var ln = str.length;
	var i=0;
	var temp="";
	for(i=ln-1; i>-1; i--) {
		if(str.charAt(i)==".")
			temp += "#";
		else
			temp += str.charAt(i);
	}

	return temp;
}

function lz_get_ss_id(str)
{
	len=str.indexOf("_");
	str=str.substring(len+1);
	len=str.indexOf("_");
	str=str.substring(len+1);
	return str;
}

function lz_get_ss_no(str) {
	len=str.indexOf("_");
	str=str.substring(0,len);
	return parseInt(str);
}

function lz_get_stm() 
{ 
	var date = new Date(); 
	var yy=date.getFullYear(); 
	var mm=date.getMonth(); 
	var dd=date.getDate(); 
	var hh=date.getHours(); 
	var ii=date.getMinutes(); 
	var ss=date.getSeconds(); 
	var i; 
	var tm=0; 
	for(i = 1970; i < yy; i++) { 
		if ((i % 4 == 0 && i % 100 != 0) || (i % 100 == 0 && i % 400 == 0)) { 
			tm=tm+31622400; 
		} 
		else { 
			tm=tm+31536000; 
		} 
	}
	mm=mm+1;
	
	for(i = 1; i < mm; i++) { 
		if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) { 
			tm=tm+2678400; 
		} 
		else { 
			if (i == 2) { 
				if ((yy % 4 == 0 && yy % 100 != 0) || (yy % 100 == 0 && yy % 400 == 0)) { 
					tm=tm+2505600; 
				} 
				else { 
					tm=tm+2419200; 
				} 
			} 
		 	else { 
				tm=tm+2592000; 
			} 
		} 
	}
	
	tm = tm +  (dd-1) * 86400; tm = tm +  hh * 3600; 
	tm = tm +  ii * 60; 
	tm = tm +  ss; 
	return tm; 
} 

function lz_get_ctm(str) {
	len=str.indexOf("_");
	str=str.substring(len+1);
	len=str.indexOf("_");
	str=str.substring(0,len);
	return parseInt(str, 10); 
}

/* main function */
function lz_main()
{
	var unit_id     = "675816";
	var client_ip   = "127.0.0.1";
	var server_time = "1447722101";
	var verify_code = "3c45d8e5";
	var type        = "2";
	var dest_path   = "http://dt.tongji.linezing.com/tongji.do?unit_id="+unit_id; 
	var expire_time = 1800; 
	var i;

	var host=document.location.host;
	var domain = lz_get_domain(host.toLocaleLowerCase());
	var hashval = 0;
	for (i=0; i< domain.length; i++){
		hashval += domain.charCodeAt(i);
	}

	var uv_str = lz_get_cookie("lzstat_uv");
	var uv_id = "";
	var uv_new = 0;
	if (uv_str == ""){
		uv_new = 1;

		var rand1 = parseInt( Math.random() * 4000000000 );
		var rand2 = parseInt( Math.random() * 4000000000 );
		uv_id = String(rand1) + String(rand2);

		var value = uv_id+"|"+unit_id;
		
		lz_set_cookie("lzstat_uv", value, 1);
	}
	else{
		var arr = uv_str.split("|");
		uv_id  = arr[0];
		var uids_str = arr[1];
		var uids = uids_str.split("@");
		var uid_num = uids.length;

		var bingo = 0;
		for(var pos=0,max=uids.length;pos<max;pos++) {
			var uid = uids[pos];
			if (uid == unit_id){
				bingo = 1;
				break;
			}
		}

		if (bingo == 0){
			uv_new = 1;

			if (uid_num >= 100){
				var value = uv_id+"|"+unit_id;
			}
			else{
				var value = uv_str+"@"+unit_id;
			}	
			
			lz_set_cookie("lzstat_uv", value, 1);
		}
	}

	var ss_str = lz_get_cookie("lzstat_ss"); 
	var ss_id = ""; 
	var ss_no = 0;
	if (ss_str == ""){
		ss_no = 0;
		var rand = parseInt(Math.random() * 4000000000);
		ss_id = String(rand);
		value = ss_id+"_"+"0_"+lz_get_stm()+"_"+unit_id;
		lz_set_cookie("lzstat_ss", value, 0); 
	} 
	else { 
		var arr = ss_str.split("|");
		var ss_num = arr.length;

		var bingo = 0;
		for(var pos=0,max=arr.length;pos<max;pos++) {
			var ss_info = arr[pos];
			var items = ss_info.split("_");

			var cookie_ss_id  = items[0];
			var cookie_ss_no  = parseInt(items[1]);
			var cookie_ss_stm = items[2];
			var cookie_ss_uid = items[3];

			if (cookie_ss_uid == unit_id){
				bingo = 1;

				if (lz_get_stm() - cookie_ss_stm > expire_time) { 
					ss_no = 0;
					var rand = parseInt(Math.random() * 4000000000);
					ss_id = String(rand);
				} 
				else{
					ss_no = cookie_ss_no + 1;
					ss_id = cookie_ss_id;
				}

				value = ss_id+"_"+ss_no+"_"+lz_get_stm()+"_"+unit_id;

				arr[pos] = value;
				ss_str = arr.join("|");
				lz_set_cookie("lzstat_ss", ss_str, 0); 

				break;
			}
		}

		if (bingo == 0)
		{
			ss_no = 0;
			var rand = parseInt(Math.random() * 4000000000);
			ss_id = String(rand);
			value = ss_id+"_"+"0_"+lz_get_stm()+"_"+unit_id;

			if (ss_num >= 20){
				pos = parseInt(Math.random() * ss_num);
			}
			else{
				pos = ss_num;
			}

			arr[pos] = value;
			ss_str = arr.join("|");
			lz_set_cookie("lzstat_ss", ss_str, 0); 
		}
	}

	var ref = document.referrer; 
	ref = lz_encode(String(ref)); 

	var url = document.URL; 
	url = lz_encode(String(url)); 

	var title = document.title;
	title = escape(String(title)); 

	var charset = document.charset;
	charset = lz_encode(String(charset)); 

	var screen = lz_get_screen(); 
	screen = lz_encode(String(screen)); 

	var color =lz_get_color(); 
	color =lz_encode(String(color)); 

	var language = lz_get_language(); 
	language = lz_encode(String(language));
 
	var agent =lz_get_agent(); 
	agent =lz_encode(String(agent));

	var jvm_enabled =lz_get_jvm_enabled(); 
	jvm_enabled =lz_encode(String(jvm_enabled)); 

	var cookie_enabled =lz_get_cookie_enabled(); 
	cookie_enabled =lz_encode(String(cookie_enabled)); 

	var flash_ver = lz_get_flash_ver();
	flash_ver = lz_encode(String(flash_ver)); 

	var app = lz_get_app(); 
	app = lz_encode(String(app)); 

	var filtered = 0;
	var domain_filters = new Array();
	var ip_filters = new Array();

		domain_filters[0] = "gro#tra763";
		domain_filters[1] = "moc#olzd";
		domain_filters[2] = "moc#tra763";
		domain_filters[3] = "moc#df571";
		domain_filters[4] = "ten#oog1";
		domain_filters[5] = "nc#ppk1";
		domain_filters[6] = "nc#osnaknak";
		domain_filters[7] = "nc#emocwww";
		domain_filters[8] = "nc#psalla";
		domain_filters[9] = "moc#oesii";
		domain_filters[10] = "moc#kh0083";
		domain_filters[11] = "nc#kpwww";
		domain_filters[12] = "nc#moc#zw001";
		domain_filters[13] = "nc#kpemoc";
		domain_filters[14] = "moc#eyiq063";
		domain_filters[15] = "moc#qqa4";
		domain_filters[16] = "ten#aboakoak";
		domain_filters[17] = "moc#ecilliw";
		domain_filters[18] = "nc#moc#ibeea";
		domain_filters[19] = "moc#ibeea";
		domain_filters[20] = "nc#tra763";
		domain_filters[21] = "moc#025sns";
		domain_filters[22] = "moc#og321oah";
		domain_filters[23] = "moc#9zznc";
		domain_filters[24] = "nc#9zznc";
		domain_filters[25] = "moc#d135";
		domain_filters[26] = "moc#ridzoog";
		domain_filters[27] = "ten#rqrq";
		domain_filters[28] = "moc#195nak";
		domain_filters[29] = "moc#uynijtn";
		domain_filters[30] = "moc#falwen";
		domain_filters[31] = "nc#moc#njyhxj";
	
	var escape_domain = str_reverse(domain);
	for (i in domain_filters){
		if(domain_filters[i] == escape_domain)
			filtered = 1;	
	}

	
	for (i in ip_filters){
		if(ip_filters[i] == client_ip){
			filtered = 1;
			break;
		}
	}

	var url_id = 0;
	var cur_url = location.href;

	dest=dest_path+"&uv_id="+uv_id+"&uv_new="+uv_new+"&cna="+""+"&cg="+""+"&mid="+""+"&mmland="+""+"&ade="+""+"&adtm="+""+"&sttm="+""+"&cpa="+""+"&ss_id="+ss_id+"&ss_no="+ss_no+"&ec="+cookie_enabled+"&ref="+ref+"&url="+url+"&title="+title+"&charset="+charset+"&domain="+domain+"&hashval="+hashval+"&filtered="+filtered+"&app="+app+"&agent="+agent+"&color="+color+"&screen="+screen+"&lg="+language+"&je="+jvm_enabled+"&fv="+flash_ver+"&st="+server_time+""+"&vc="+verify_code+""+"&ut=2"+"&url_id="+url_id+"&cnu="+String(Math.random());

document.write("<img src=\""+dest+"\" border=\"0\" width=\"1\" height=\"1\" />");

	var icon_link_host="tongji.alimama.com";

	document.write( "<a href=\"http://"+icon_link_host+"/report.html?unit_id="+unit_id+"\" target=\"_blank\"><img src=\"http://js.tongji.linezing.com/icon1.gif\" border=\"0\" alt=\"&#37327;&#23376;&#32479;&#35745;\"></a>" );

        if(cur_url.indexOf('#lzclickmap=')>-1) {
                var token = cur_url.substr(cur_url.indexOf('#lzclickmap='), 44);
                token = token.replace(/([\/'])/g, '\\$1');
		token = token.replace(/[^\w\.\/]/ig,'');
                document.write('<scr'+'ipt src=\'http://tongji.linezing.com/clickmap/load_clickmap.html?r='+Math.random()+token+'\'></scr'+'ipt>');
                return false;
        }

        if(url_id>0)
                document.write('<scr'+'ipt src=\'http://js.tongji.linezing.com/675816/'+url_id+'/clickcollect.js\'></scr'+'ipt>');
}

lz_main();
