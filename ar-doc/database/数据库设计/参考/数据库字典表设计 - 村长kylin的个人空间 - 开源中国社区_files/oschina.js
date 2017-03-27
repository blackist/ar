
function getScrollY() {
    scrOfY = 0;
    if( typeof( window.pageYOffset ) == "number" ) {
        scrOfY = window.pageYOffset;
    } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
        scrOfY = document.body.scrollTop;
    } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
        scrOfY = document.documentElement.scrollTop;
    }
    return scrOfY;
}

function ajax_call(the_url,the_param){
	$.ajax({
		type:'POST',
		url:the_url,
		data:the_param,
		success:function(html){alert(html);},
		error:function(html){
			alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
		}
	});
}

function ajax_call_and_refresh(the_url, the_param){
	$.ajax({
		type:'POST',
		url:the_url,
		data:the_param,
		success:function(html){location.reload();},
		error:function(html){
			alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
		}
	});
}

/**
 * 使用ajax提交数据
 */
function ajax_post(the_url,the_param,succ_callback){
	$.ajax({
		type	: 'POST',
		cache	: false,
		url		: the_url,
		data	: the_param,
		success	: succ_callback,
		error	: function(html){
			alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
		}
	});
}

/**
 * 使用ajax获取数据
 */
function ajax_get(the_url,error_tip,succ_callback){
	$.ajax({
		type	: 'GET',
		cache	: true,
		url		: the_url,
		success	: succ_callback,
		error	: function(html){
			if(error_tip)
			alert("获取数据失败，代码:" +html.status+ "，请稍候再试");
		}
	});
}

/**
 * 显示登录对话框
 */
function login(){
	$.ajax({
		type	: "GET",
		cache	: true,
		url		: "/action/ajax/login",
		success : function(data){$.fancybox(data);}
	});	
}

/**
 * 执行登录过程，登录成功后回调callback方法
 */
function login_and_do(callback)
{
	//check login
	ajax_post('/action/user/check_login','',function(msg){
		if(msg=="1"){//已登录
			var rtn = callback(null);
			if(typeof(rtn)=='string'){				
				$.ajax({
					type	: "GET",
					cache	: true,
					url		: rtn,
					success : function(data){$.fancybox(data);}
				});	
			}
		}
		else{ //执行登录过程
			$.ajax({
				type	: "GET",
				cache	: false,
				data	: callback,
				url		: "/action/ajax/login",
				success : function(data){$.fancybox(data);}
			});	
		}
	});
}

function popup(url){
	ajax_post(url,"",function(data){$.fancybox(data);});
}

function popup(url,args){
	ajax_post(url,args,function(data){$.fancybox(data);});
}

//发送站内留言(实现自动登录效果)
function sendmsg(uid,mid) {
	popup("/action/ajax/sendmsg?to="+uid+"&msg="+mid);
}

//举报问题
function report(url, obj_id, obj_type){
	popup("/action/ajax/report?id="+obj_id+"&type="+obj_type+"&url="+escape(url));
}

//完善问题说明
function make_question_more_detail(qid){
	popup("/action/ajax/make_question_more_detail?id="+qid);
}

//关注某人(实现自动登录效果)
function follow(uid) {
	//check login
	ajax_post('/action/user/check_login','',function(msg){
		if(msg=="1"){//已登录
			ajax_post("/action/ajax/follow?id="+uid,"",function(data){
				$('#LinkFollow').html(data);
			});			
		}
		else{ //执行登录过程
			$.ajax({
				type	: "GET",
				cache	: false,
				data	: 'callback=_follow('+uid+')',
				url		: "/action/ajax/login",
				success : function(data){$.fancybox(data);}
			});	
		}
	});
}

function _follow(uid,userid){
	ajax_post("/action/ajax/follow?id="+uid+"&user="+userid,"",function(data){
		$('#LinkFollow').html(data);
	});
	$.fancybox.close();	
}

//关注某人
function just_follow(uid,name,userid) {
	//check login
	ajax_post('/action/user/check_login','',function(msg){
		if(msg=="1"){//已登录
			ajax_post("/action/ajax/follow?id="+uid+"&user="+userid,"",function(data){
				alert("已关注\""+name+"\"")
			});			
		}
		else{ //执行登录过程
			alert("请先登录")
		}
	});
}

//取消关注
function unfollow(uid,userid) {
	ajax_post("/action/ajax/unfollow?id="+uid+"&user="+userid,"",function(data){$('#LinkFollow').html(data);});
}

function just_unfollow(uid,userid,f_callback) {
	ajax_post("/action/ajax/unfollow?id="+uid+"&user="+userid,"",function(data){
		if(f_callback)
			f_callback(null)
	});	
}
//jQuery的cookie扩展
$.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + options.path : '';
        var domain = options.domain ? '; domain=' + options.domain : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};

/**
 * Create a popupbox with the object id and html url two parameters.
 */
jQuery.popup = function(targetid,htmlUrl) {
	$(window).load(function(){
		$("#"+targetid).load(htmlUrl,function(){
			$("#"+targetid+" div[id=Popup]").css({"right":"0px","bottom":"1px","height":$("#"+targetid+" div[id=Popup]").top});
			$("#"+targetid+" div[id=Popup]").slideDown("slow");
			$("#"+targetid).find("label[id=tomin]").toggle(function(){
					$("#"+targetid+" div[id=popmsg]").slideUp("slow");
					$(this).css("background-image","url('/img/notice_max.gif')").attr("title","最大化");
				},function(){
					$("#"+targetid+" div[id=popmsg]").slideDown("slow");
					$(this).css("background-image","url('/img/notice_min.gif')").attr("title","最小化");
			});

			$("#"+targetid).find("label[id=toclose]").click(function(){
				$("#"+targetid+" div[id=Popup]").hide();
			});
		});
	}).scroll(function(){
		//var poptop = document.documentElement.scrollTop;
		//$("#"+targetid+" div[id=Popup]").css({"right":"0px","bottom":-poptop});
		$("#"+targetid+" div[id=Popup]").css({"right":"0px","bottom":0});
	}).resize(function(){
		//var poptop = document.documentElement.scrollTop;
		//$("#"+targetid+" div[id=Popup]").css({"right":"0px","bottom":-poptop});
		$("#"+targetid+" div[id=Popup]").css({"right":"0px","bottom":0});
	});
	
};

/**
 * Heartbeat
 */
$.jheartbeat = {
    options: {delay: 10000},
	beatfunction:  function(){},
	timeoutobj:  {id: -1},

    set: function(options, onbeatfunction) {
		if (this.timeoutobj.id > -1) {
			clearTimeout(this.timeoutobj);
		}
        if (options) {
            $.extend(this.options, options);
        }
        if (onbeatfunction) {
            this.beatfunction = onbeatfunction;
        }

		this.timeoutobj.id = setTimeout("$.jheartbeat.beat();", this.options.delay);
    },

    beat: function() {
		this.timeoutobj.id = setTimeout("$.jheartbeat.beat();", this.options.delay);
        this.beatfunction();
    }
};

function timer(func, interval){
	$.jheartbeat.set({delay: interval}, func);
}

function html_encode(str)   
{   
  var s = "";   
  if (str.length == 0) return "";   
  s = str.replace(/&/g, "&amp;");   
  s = s.replace(/</g, "&lt;");   
  s = s.replace(/>/g, "&gt;");   
  //s = s.replace(/ /g, "&nbsp;");   
  s = s.replace(/\'/g, "&#39;");   
  s = s.replace(/\"/g, "&quot;");   
  //s = s.replace(/\n/g, "<br>");   
  return s;   
}   

function html_decode(str)   
{   
  var s = "";   
  if (str.length == 0) return "";   
  s = str.replace(/&gt;/g, "&");   
  s = s.replace(/&lt;/g, "<");   
  s = s.replace(/&gt;/g, ">");   
  s = s.replace(/&nbsp;/g, " ");   
  s = s.replace(/&#39;/g, "\'");   
  s = s.replace(/&quot;/g, "\"");   
  s = s.replace(/<br>/g, "\n");   
  return s;   
}   

function HashMap()
{
     /** Map 大小 **/
     var size = 0;
     /** 对象 **/
     var entry = new Object();
     
     /** 存 **/
     this.put = function (key , value)
     {
         if(!this.containsKey(key))
         {
             size ++ ;
         }
         entry[key] = value;
     }
     
     /** 取 **/
     this.get = function (key)
     {
         if( this.containsKey(key) )
         {
             return entry[key];
         }
         else
         {
             return null;
         }
     }
     
     /** 删除 **/
     this.remove = function ( key )
     {
         if( delete entry[key] )
         {
             size --;
         }
     }
     
     /** 是否包含 Key **/
     this.containsKey = function ( key )
     {
         return (key in entry);
     }
     
     /** 是否包含 Value **/
     this.containsValue = function ( value )
     {
         for(var prop in entry)
         {
             if(entry[prop] == value)
             {
                 return true;
             }
         }
         return false;
     }
     
     /** 所有 Value **/
     this.values = function ()
     {
         var values = new Array(size);
         for(var prop in entry)
         {
             values.push(entry[prop]);
         }
         return values;
     }
     
     /** 所有 Key **/
     this.keys = function ()
     {
         var keys = new Array(size);
         for(var prop in entry)
         {
             keys.push(prop);
         }
         return keys;
     }
     
     /** Map Size **/
     this.size = function ()
     {
         return size;
     }
}

var recover_rotate = function(id){
	var degrees = ['init_degree','first_degree','second_degree','third_degree'];
	for ( var int = 0; int < degrees.length; int++) {
		var deg = degrees[int];
		$(id).removeClass(deg);
	}
	$(id).addClass('init_degree');
};

var rotate_img = function(id,direction){
	var img = document.getElementById(id);
	var degrees = ['init_degree','first_degree','second_degree','third_degree'];
	var getIndexOfDegree = function(clazz){
		var clazzs = clazz.split(' ');
		for(var c in clazzs){
			var cur = clazzs[c];
			for (var i = degrees.length - 1; i >= 0; i--) {
				if(degrees[i] == cur){
					return i;
				}
			};
		}
		return 0;
	};
	var index = getIndexOfDegree(img.className);
	var next = index;
	if(direction){
		next = (index + 1) % degrees.length;
	}else{
		next = index - 1;
		if(next < 0){
			next = degrees.length + next;
		}
	}
	img.className = degrees[next];
	//increase or decrease height
	var wh = img.width - img.height;
	var parent = $(img).parent();
	if(wh>0){
		if(next == 1 || next == 3){
			parent.height(parent.height()+wh);
		}else{
			parent.height(parent.height()-wh);
		}
	}else{
		if(next == 1 || next == 3){
			parent.data('orh',parent.height());
			parent.height(img.width+20);
		}else{
			parent.height(parent.data('orh'));
		}
	}
};

/*
 * I think it can work for Chinese Users.
 * Lewis Lv lzlhero@gmail.com
 */

;(function($) {
if ($.fn.textbox) {
	return;
}

$.fn.textbox = function(settings) {
	var defaults = {
		maxLength: -1,
		onInput: null,
		_pasteHandler: function(event) {
			var textarea = this;
			window.setTimeout(function() {
				inputHandler.call(textarea, event);
			}, 0);
		},
		_cutHandler: function(event) {
			var textarea = this;
			window.setTimeout(function() {
				inputHandler.call(textarea, event);
			}, 0);
		},
		_keyupHandler: function(event) {
			if (opts.maxLength < 0) {
				if ($.isFunction(opts.onInput)) {
					opts.onInput.call(this, event, {maxLength: opts.maxLength, leftLength: -1});
				}
			}
			else {
				inputHandler.call(this, event);
			}
		},
		_blurHandler: function(event) {
			fixLength(this);
		}
	};
	var opts = $.extend(defaults, settings);

	// This is the prefect get caret position function.
	// You can use it cross browsers.
	function getInsertPos(textbox) {
		var iPos = 0;
		if (textbox.selectionStart || textbox.selectionStart == "0") {
			iPos = textbox.selectionStart;
		}
		else if (document.selection) {
			textbox.focus();
			var range = document.selection.createRange();
			var rangeCopy = range.duplicate();
			rangeCopy.moveToElementText(textbox);
			while (range.compareEndPoints("StartToStart", rangeCopy) > 0) {
				range.moveStart("character", -1);
				iPos++;
			}
		}
		return iPos;
	}

	// This is the prefect set caret position function.
	// You can use it cross browsers.
	function setInsertPos(textbox, iPos) {
		textbox.focus();
		if (textbox.selectionStart || textbox.selectionStart == "0") {
			textbox.selectionStart = iPos;
			textbox.selectionEnd = iPos;
		}
		else if (document.selection) {
			var range = textbox.createTextRange();
			range.moveStart("character", iPos);
			range.collapse(true);
			range.select();
		}
	}

	function isGreateMaxLength(strValue, strDelete) {
		if (opts.maxLength > 0) {
			return strValue.replace(/\r/g, "").length - (strDelete ? strDelete.replace(/\r/g, "").length : 0) > opts.maxLength;
		}
		else {
			return false;
		}
	}

	function fixLength(textbox) {
		if (opts.maxLength > 0) {
			var strValue = textbox.value.replace(/\r/g, "");
			if (isGreateMaxLength(strValue)) {
				textbox.value = strValue.substr(0, opts.maxLength);
			}
		}
	}

	function inputHandler(event) {
		var strValue = this.value.replace(/\r/g, "");
		if (isGreateMaxLength(strValue)) {
			var scrollTop = this.scrollTop;
			var iInsertToStartLength = getInsertPos(this) - (strValue.length - opts.maxLength);
			this.value = strValue.substr(0, iInsertToStartLength) + strValue.substr(getInsertPos(this));
			setInsertPos(this, iInsertToStartLength);
			this.scrollTop = scrollTop;
		}

		if ($.isFunction(opts.onInput)) {
			// callback for input handler
			opts.onInput.call(this, event, {
				maxLength: opts.maxLength,
				leftLength: opts.maxLength - this.value.replace(/\r/g, "").length
			});
		}
	};

	function getSelectedText(textbox) {
		var strText = "";
		if (textbox.selectionStart || textbox.selectionStart == "0") {
			strText = textbox.value.substring(textbox.selectionStart, textbox.selectionEnd);
		}
		else {
			strText = document.selection.createRange().text;
		}
		return strText.replace(/\r/g, "");
	}

	function unbindEvents(textbox, opts) {
		$(textbox)
				.unbind("paste", opts._pasteHandler)
				.unbind("cut", opts._cutHandler)
				.unbind("keyup", opts._keyupHandler)
				.unbind("blur", opts._blurHandler);
	}

	function bindEvents(textbox, opts) {
		var $textbox = $(textbox);

		if (opts.maxLength < 0) {
			$textbox.bind("keyup", opts._keyupHandler);
		}
		else {
			$textbox
					.bind("paste", opts._pasteHandler)
					.bind("cut", opts._cutHandler)
					.bind("keyup", opts._keyupHandler)
					.bind("blur", opts._blurHandler);

			fixLength(textbox);
		}
	}

	this.maxLength = function(maxLength) {
		if (maxLength) {
			opts.maxLength = maxLength;
			return this.filter("textarea").each(function() {
				unbindEvents(this, $(this).data("textbox-opts"));
				$(this).data("textbox-opts", opts);
				bindEvents(this, opts);
			}).end();
		}
		else {
			return opts.maxLength;
		}
	};

	this.input = function(callback) {
		if ($.isFunction(callback)) {
			opts.onInput = callback;
			return this.filter("textarea").each(function() {
				$(this).data("textbox-opts", opts);
			}).end();
		}

		return this;
	};

	this.fixLength = function() {
		return this.filter("textarea").each(function() {
			fixLength(this);
		}).end();
	};

	this.insertText = function(strText) {
		strText = strText.replace(/\r/g, "");
		return this.filter("textarea").each(function() {
			if (!isGreateMaxLength(this.value + strText, getSelectedText(this))) {
				if (this.selectionStart || this.selectionStart == "0") {
					var startPos = this.selectionStart;
					var endPos = this.selectionEnd;
					var scrollTop = this.scrollTop;

					this.value = this.value.substring(0, startPos) + 
								strText + this.value.substring(endPos, this.value.length);
					this.focus();

					var cPos = startPos + strText.length;
					this.selectionStart = cPos;
					this.selectionEnd = cPos;
					this.scrollTop = scrollTop;
				}
				else if (document.selection) {
					this.focus();
					var range = document.selection.createRange();
					range.text = strText;
					range.collapse(true);
					range.select();
				}

				// fired when insert text has finished
				if ($.isFunction(opts.onInput)) {
					opts.onInput.call(this, {type: "insert"}, {
						maxLength: opts.maxLength,
						leftLength: opts.maxLength - this.value.replace(/\r/g, "").length
					});
				}
			}
		}).end();
	};

	return this.filter("textarea").each(function() {
		var $textbox = $(this);

		if (settings) {
			if ($textbox.data("textbox-opts")) {
				unbindEvents(this, $textbox.data("textbox-opts"));
				$textbox.data("textbox-opts", opts);
				bindEvents(this, opts);
			}
			else {
				$textbox.data("textbox-opts", opts);
				bindEvents(this, opts);
			}
		}
		else {
			if ($textbox.data("textbox-opts")) {
				opts = $textbox.data("textbox-opts");
			}
		}
	}).end();
};
})(jQuery);