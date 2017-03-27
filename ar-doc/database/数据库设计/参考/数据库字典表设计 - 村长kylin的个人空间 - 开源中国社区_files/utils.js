/**
 * 模块工具类，用来初始化各模块视图、自定绑定事件以及其它辅助功能等
 * 
 * @class Utils
 */
Utils = (function() {

	var instance;

	/**
	 * @class Utils
	 * @constructor
	 */
	function Utils() {
		instance = this;
		return this;
	}

	/**
	 * 事件自动绑定 events:<br>
	 * 事件映射列表 映射规则：<br>
	 * "event(事件) -> selector(选择器)":"handler(事件处理器)"<br>
	 * events = { <br>
	 * "click->[document]":"doc_click_handler" <br> }<br>
	 * <span style="color:#A00">[注]</span>如果selector带有中括号[]则表明为系统全局变量，如window,document<br>
	 * 需要以 call(module) 的方式把上下文设置成当前的模块实例
	 * 
	 * @example g_utils.binder.call(module)
	 * @method binder
	 */
	Utils.prototype.binder = function(cur) {
		if (isEmpty(cur))
			cur = this;
		var events = this.Events;
		if (isEmpty(events))
			return;
		var clazz = className(this);
		if (isEmpty(clazz))
			this.clazz = clazz = "Plugin";
		Console.log("[" + clazz + "]Binding events");
		try {
			$.each(events, function(key, handler) {
				if (isEmpty(events))
					return;

				var handler = events[key];
				if (isEmpty(key))
					return;

				var sp = key.split("->");
				var evt = sp[0];
				var sel = sp[1];
				if (isEmpty(evt) || isEmpty(sel) || isNotFunc(cur[handler]) && isNotFunc(handler))
					return;
				var one = function(event) {
					if (isNotFunc(handler)) {
						return cur[handler].call(this, cur, event);
					} else {
						return handler.call(this, cur, event)
					}
				};
				var hasWindowObj = sel.indexOf("[window]") != -1;
				var hasDocumentObj = sel.indexOf("[document]") != -1;
				if (hasWindowObj) {
					$(window).unbind(evt, one);
					$(window).bind(evt, one);
					sel = sel.replace(/[\[window\]]/g, "")
				}

				if (hasDocumentObj) {
					$(document).unbind(evt, one);
					$(document).bind(evt, one);
					sel = sel.replace(/[\[document\]]/g, "")
				}

				if (isEmpty(sel))
					return;

				Console.log("\t[" + clazz + "]Binding event[" + handler + "]");

				$(sel).die(evt).live(evt, one);

			})
		} catch (e) {
			Console.log("Error Occured When Binding Events:" + e);
		}
	};

	/**
	 * 初始化参数：初始化arguments第一个参数（json格式），将其设置为当前对象的成员属性， params为json格式数据<br>
	 * 
	 * @method initParams
	 * @example g_utils.initParams.call(module)
	 * @params {Object} params JSON类型数据
	 */
	Utils.prototype.initParams = function(params) {
		var clazz = className(this);
		if (isNotEmpty(params)) {
			Console.log("[" + clazz + "]Initializing Params with outer params");
			for ( var key in params) {
				this[key] = params[key];
			}
		}
		if (isNotEmpty(this.arg) && isNotEmpty(this.arg[0])) {
			Console.log("[" + clazz + "]Initializing Params with arguments[0]");
			var opt = this.arg[0];
			for ( var key in opt) {
				if (isNotEmpty(opt[key]))
					this[key] = opt[key];
			}
		}
	};

	/**
	 * 初始化视图
	 * 自动像viewLink+"/"+ident路径请求模版，返回后插入到target中，初始化完成执行afterInit回调，并将当前对象当作调用上下文对象
	 * 
	 * @method initParams
	 * @example g_utils.initView.call(module,ident,callback,async)
	 * @param {String}
	 *            ident 代码的唯一标识
	 * @param {Function}
	 *            afterInit 当视图初始化好后调用的回调函数
	 * @param {Boolean}
	 *            async 是否采用异步方式加载数据，true或undefined时为异步方式，false为同步方式
	 */
	Utils.prototype.initView = function(ident, afterInit, async) {
		var cur = this;
		var clazz = className(this);
		var func = "on" + clazz + "ViewInit";
		if (g_status.once) {
			afterInit.call(cur, ident, $(this.target).html());
			plugins.fireEvent(func, cur);
			return;
		}
		if (isEmpty(ident))
			ident = g_status.ident;
		Console.log("[" + this.clazz + "]Initializing View with ident:[" + ident + "] " + (isFunc(afterInit) ? "and callback" : ""));
		var link = this.viewLink + "/" + ident + "?" + new Date().getTime();
		if (isEmpty(async) || async) {
			$.get(link, function(e) {
				cur.view = $(e);
				Console.log("[" + cur.clazz + "]View Loaded in async");
				if (isNotEmpty(cur.target) && isNotEmpty(e)) {
					cur.target.html(e);
					afterInit.call(cur, ident, cur.view);
					plugins.fireEvent(func, cur);
				}
			});
		} else {
			var e = instance.load(link, async);
			cur.view = $(e);
			Console.log("[" + cur.clazz + "]View Loaded in syn");
			if (isNotEmpty(cur.target) && isNotEmpty(e)) {
				cur.target.html(e);
				afterInit.call(cur, ident, cur.view);
				plugins.fireEvent(func, cur);
			}
		}
	};

	/**
	 * 采用同步或异步方式加载远端资源
	 * 
	 * @method load
	 * @param {String}
	 *            link 请求链接地址
	 * @param {Boolean}
	 *            async 是否采用异步方式加载数据
	 * @param {Function}
	 *            callback 采用异步方式的回调函数
	 * @param {Object}
	 *            data 发送请求时附带参数数据
	 * @return {String} responseText 采用同步方式时直接返回结果，采用异步方式时将返回 undefined
	 */
	Utils.prototype.load = function(link, async, callback, data) {
		var cur = this;
		return $.ajax({
			url : link,
			success : function(html) {
				if (isFunc(callback))
					callback.call(cur, html);
			},
			data : data,
			async : async,
			type : "post"
		}).responseText;
	};

	/**
	 * 处理服务器端返回的JSON类型数据结果，判断是否为出错信息，并提供两种方式处理错误
	 * 
	 * @method errorHandler
	 * @param {String}
	 *            msg 服务器传来待处理的 JSON 格式字符串
	 * @param {Function}
	 *            success 无错误时的回调函数，该回调将获得处理过后的 JSON 数据
	 * @param {Function}
	 *            error 服务器端传来错误信息时调用，将返回出错 JSON 数据
	 * @param {Boolean}
	 *            diy 是否立即使用 error
	 *            回调函数处理错误，true为立即使用error处理，false和undefined为系统使用弹窗显示错误然后再调用error回调处理
	 */
	Utils.prototype.errorHandler = function(msg, success, error, diy) {
		try {
			var msg = eval("(" + msg + ")");
			if (msg.error) {
				if (isEmpty(diy) || !diy) {
					dialog.get("error", msg.msg);
					if (typeof error != "undefined") {
						setTimeout(function() {
							error(msg);
						}, 2000);
					}
					return false;
				} else {
					if (typeof error != "undefined") {
						return error(msg);
					}
				}
			}
			return success(msg)
		} catch (e) {
			if (typeof e.stack != 'undefined') {
				dialog.get("jserror", e.stack.substring(0, 50));
			} else
				dialog.get("jserror", e.message);
			return;
		}
	};

	/**
	 * 阻止浏览器默认事件
	 * 
	 * @method stopDefault
	 * @param {Object}
	 *            event 浏览器事件对象
	 */
	Utils.prototype.stopDefault = function(event) {
		event.preventDefault();
		event.returnvalue = false;
	};

	/**
	 * 初始状态信息，该方法用来从服务器端加载一段js，用eval执行来初始化全局变量
	 * 
	 * @method initStatus
	 * @param {String}
	 *            link 请求链接地址
	 */
	Utils.prototype.initStatus = function(link) {
		var status = this.load(link, false);
		if (isNotEmpty(status))
			eval(status);
	};

	/**
	 * 获得以“http://”开头的链接地址，并加上当前域的HOST名称,例如
	 * g_utils.getHttpLink("/code/abcdefg")将返回"http://runjs.cn/code/abcdefg"
	 * 
	 * @method getHttpLink
	 * @return {String} link 返回处理好的链接地址
	 */
	Utils.prototype.getHttpLink = function(link) {
		if (isEmpty(link))
			return;
		if (link.indexOf("http") == -1) {
			if (link.indexOf("/") == 0) {
				link = g_status.host + link;
			} else {
				link = g_status.host + "/" + link;
			}
		}
		return link;
	};

	Utils.prototype.notClickOn = function(event, selectors, callback) {
		if (isNotEmpty(event) && (!$(event.srcElement || event.target).is(selectors)) && isFunc(callback))
			callback.call(this, event);
	};

	Utils.prototype.loadImages = function(sources, callback) {
		var images = {};
		var loadedImages = 0;
		var numImages = 0;
		for ( var src in sources) {
			numImages++;
		}
		for ( var src in sources) {
			images[src] = new Image();
			images[src].onload = function() {
				if (++loadedImages >= numImages) {
					callback(images);
				}
			};
			images[src].src = sources[src];
		}
	};

	Utils.prototype.hasHtml = function(content) {
		var reg = new RegExp("<\/?.+?>", "g")
		return reg.test(content);
	};

	/**
	 * 将形如"2013-02-28 17:35:00"的字符串转换为Date对象
	 */
	Utils.prototype.parseDate = function(s) {
		var re = /^(\d{4})-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)$/;
		var m = re.exec(s);
		return m ? new Date(m[1], m[2] - 1, m[3], m[4], m[5], m[6]) : null;
	};
	
	/**
	 * 通过字符串动态调用函数:
	 * 'osc.upload_img.onSuccess'
	 * Usage:g_utils.invoke.call(osc.upload_img,'onSuccess',{img:'http://oschina.net/img/logo.gif'})
	 */
	Utils.prototype.invoke = function(method_name,args){
		if(isEmpty(method_name))
			return;
		var methods = method_name.split('.');
		var context = this;
		var invoker = this;
		for(var i=0;i<methods.length;i++){
			var tmp = invoker[methods[i]];
			if(i!=methods.length-1 && typeOf(tmp,'object')){
				invoker = tmp;
			}else if(isFunc(tmp)){
				tmp.call(context,args);
			}
		}
	};

	return Utils;
})();

/**
 * Utils 类实例[全局]
 * 
 * @attribute g_utils
 */
g_utils = new Utils();

/**
 * 判断当前对象是否为空
 * 
 * @method isEmpty
 * @param {Object}
 *            obj
 * @return {Boolean} empty 当为 null,undefined,"" 将返回true
 */
window.isEmpty = function(obj) {
	return (obj == null || typeof obj == "undefined" || obj.length == 0)
}

/**
 * 判断当前对象是否非空
 * 
 * @method isNotEmpty
 * @param {Object}
 *            obj
 * @return {Boolean}
 */
window.isNotEmpty = function(obj) {
	return !isEmpty(obj);
}

/**
 * 判断是否为函数
 * 
 * @method isFunc
 * @param {Object}
 *            fun
 * @return {Boolean}
 */
window.isFunc = function(fun) {
	return (fun != null && typeof fun == "function");
}

/**
 * 判断不是函数
 * 
 * @method isNotFunc
 * @param {Object}
 *            fun
 * @return {Boolean}
 */
window.isNotFunc = function(fun) {
	return !isFunc(fun);
}

/**
 * 判断 cur 是否为 type 类型
 * 
 * @method typeOf
 * @param {Object}
 *            cur
 * @param {String}
 *            type
 * @example typeOf("Hello","string");//将返回true
 * @return {Boolean}
 */
window.typeOf = function(cur, type) {
	if (typeof type != "string")
		return false;
	return typeof cur == type;
}

/**
 * 判断是否为数组
 * 
 * @method isArray
 * @param {Object}
 *            array
 * @return {Boolean}
 */
window.isArray = function(array) {
	return isNotEmpty(array) && className(array) == "Array"
}

/**
 * 判断不是数组
 * 
 * @method isNotArray
 * @param {Object}
 *            arr
 * @return {Boolean}
 */
window.isNotArray = function(arr) {
	return !isArray(arr);
}

/**
 * 获取当前模块名
 * 
 * @method className
 * @param {Object}
 *            obj
 * @example className(g_utils);//返回 "Utils"
 * @return
 */
window.className = function(obj) {
	if (obj && obj.constructor && obj.constructor.toString) {
		var arr = obj.constructor.toString().match(/function\s*(\w+)/);
		if (arr && arr.length == 2) {
			obj.clazz = arr[1]
			return arr[1];
		}
	}
	return undefined;
}

/**
 * 判断两个对象是否为相同的类
 * 
 * @method isSameClass
 * @param {Object}
 *            cur
 * @param {Object}
 *            cur2
 * @return {Boolean}
 */
window.isSameClass = function(cur, cur2) {
	if (isNotEmpty(cur) && isNotEmpty(cur2)) {
		return className(cur) == className(cur2);
	}
	return false;
}

/**
 * 判断两个对象为不同类
 * 
 * @method isDifClass
 * @param {Object}
 *            cur
 * @param {Object}
 *            cur2
 * @return {Boolean}
 */
window.isDifClass = function(cur, cur2) {
	return !isSameClass(cur, cur2);
}

/**
 * 以 window.open 方式打开弹窗
 * 
 * @method openwindow
 * @param {String}
 *            url
 * @param {String}
 *            name
 * @param {Number}
 *            iWidth
 * @param {Number}
 *            iHeight
 */
window.openwindow = function(url, name, iWidth, iHeight) {
	var url; // 转向网页的地址;
	var name; // 网页名称，可为空;
	var iWidth; // 弹出窗口的宽度;
	var iHeight; // 弹出窗口的高度;
	var iTop = (window.screen.availHeight - 30 - iHeight) / 2; // 获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; // 获得窗口的水平位置;
	window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}

/**
 * 返回 true 且啥也不处理的回调函数，用于{{#crossLink "Dialog"}}{{/crossLink}}中设置无所作为的按钮的事件
 * 
 * @method doNothing
 * @example dialog.get("confrim2",doNothing,doNow);//doNow 为回调函数
 * @return {Boolean}
 */
window.doNothing = function() {
	return true;
}

/**
 * 更新浏览器地址栏链接地址
 * 
 * @method updateUrl
 * @param {String}
 *            url
 */
window.updateUrl = function(url) {
	if (window.history && window.history.pushState) {
		window.history.pushState(null, url, url);
	}
};

/**
 * 判断当前是否处在iframe中
 * 
 * @method isIframe
 * @return {Boolean}
 */
window.isIframe = function() {
	return top.location != self.location;
}

/**
 * 判断当前不处在iframe中
 * 
 * @method isIframe
 * @return {Boolean}
 */
window.isNotIframe = function() {
	return !isIframe();
};

/**
 * 利用数组的join构造字符串，提高字符串拼接效率
 * 
 * @method buildString
 * @param arguments
 *            {String|Number}
 * @return {String} 拼接后的字符串
 */
window.buildString = function() {
	var str = [];
	for ( var i = 0; i < arguments.length; i++) {
		str[i] = arguments[i];
	}
	return str.join("");
};

window.console = window.console || {};

console.log || (console.log = typeof opera != "undefined" ? opera.postError : function(msg) {
});

/*---IE Extend---*/
if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function(elt /* , from */) {
		var len = this.length >>> 0;

		var from = Number(arguments[1]) || 0;
		from = (from < 0) ? Math.ceil(from) : Math.floor(from);
		if (from < 0)
			from += len;

		for (; from < len; from++) {
			if (from in this && this[from] === elt)
				return from;
		}
		return -1;
	};
}

ConsoleUtils = (function() {
	var open = false;
	function ConsoleUtils(op) {
		open = op;
	}
	ConsoleUtils.prototype.toggle = function() {
		open = !open;
	};
	ConsoleUtils.prototype.open = function() {
		open = true;
	}
	ConsoleUtils.prototype.close = function() {
		open = false;
	}
	ConsoleUtils.prototype.log = function(msg) {
		if (open)
			console.log(msg);
	}
	return ConsoleUtils;
})();

Console = new ConsoleUtils(false);
