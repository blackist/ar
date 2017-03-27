var osc = (function(window) {

	var default_params = {
		my_tips : "#MySpace"
	};

	var events = {
		// 为自定义select控件注册事件
		"mouseenter mouseleave->.control_select" : function() {
			$(this).find(".cs_content").toggle();
		}
	};

	var osc = {
		Events : events,
		modules : {},
		init : function() {
			$.extend(this, default_params);
			g_utils.binder.call(this);
			// 将方法扩展到jQuery
			$.fn.extend({
				insertAtCaret : this.insertAtCaret
			});
			return this;
		},
		/**
		 * 在textarea光标处插入字符
		 * 
		 * @method insertAtCaret
		 * @param {String}
		 *            myValue 插入值
		 */
		insertAtCaret : function(myValue) {
			var $t = $(this)[0];
			if ($t.selectionStart || $t.selectionStart == '0') {
				var startPos = $t.selectionStart;
				var endPos = $t.selectionEnd;
				var scrollTop = $t.scrollTop;
				$t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
			} else {
				this.value += myValue;
			}
			if ($.browser.msie) {
				this.blur();
			}
		},
		/**
		 * 将动弹中的表情替换成图片
		 * 
		 * @method refactorTweetContent
		 * @param {String}
		 *            content 需要重构的内容
		 */
		refactorTweetContent : function(content) {
			var reg = /\[(([1-9])|([1-9][0-9])|(1[0-3][0-9]))\]/ig;
			var faces = content.match(reg);
			if (isEmpty(faces))
				return content;
			$.each(faces, function(i, face) {
				if (i >= 5)
					return;
				var id = face.replace(/\[|\]/ig, '');
				content = content.replace(face, '<img src="http://www.oschina.net/js/ke/plugins/emoticons/images/' + id + '.gif" border="0" alt="" />');
			});
			return content;
		},
		/**
		 * 简易模板引擎，处理形式为{user.name}的模版
		 * 
		 * @method tpl
		 * @param {String}
		 *            template 模版代码
		 * @param {JSON}
		 *            data json格式数据
		 */
		tpl : function(template, data) {
			return template.replace(/\{([\w\.]*)\}/g, function(str, key) {
				var keys = key.split("."), value = data[keys.shift()];
				$.each(keys, function() {
					value = value[this];
				});
				return (value === null || value === undefined) ? "" : value;
			});
		},
		/**
		 * 检查全局变量 g_msg，显示消息提醒
		 * 
		 * @method show_tips
		 * @param
		 * @return
		 */
		show_tips : function(target, text, opt) {
			if (!g_user.login || isEmpty(g_msg.total_count) || g_msg.total_count == 0)
				return;
			if (arguments.length == 0) {
				target = $(this.my_tips);
				text = g_msg.text;
				opt = {
					className : 'tip-yellowsimple',
					content : text,
					showOn : 'none',
					alignTo : 'target',
					alignX : 'inner-right',
					alignY : 'bottom',
					offsetX : 0,
					offsetY : 5,
					fade : false,
					slide : false
				};
			}
			return target.poshytip(opt).poshytip('show');
		},
		show_recommend_group:function(text){
			if($.cookie("noRmd"))
				return;
			var target = $("#MyCities");
			var opt = {
					className : 'tip-yellowsimple',
					content : text,
					showOn : 'none',
					alignTo : 'target',
					alignX : 'inner-right',
					alignY : 'bottom',
					offsetX : -10,
					offsetY : 5,
					fade : false,
					slide : false
				};
			return target.poshytip(opt).poshytip('show');
		},
		/**
		 * 显示讨论区技术问答版块软件标签介绍
		 */
		show_tag_introduce_project:function(){
			var target = $(".tag.project");
			var opt = {
					className : 'tip-yellowsimple question-tag',
					content : function(updateShow){
						var tagId = $(this).data('id');
						if(tagId){
							setTimeout(function(){
								ajax_post("/action/ajax/tag_introduce","tag="+tagId+"&type=project",function(data){
									updateShow(data);
									var arrowtop = $('.question-tag').find('.tip-arrow-top');
									arrowtop.css({
										left:'5%'
									});
									var arrowbottom = $('.question-tag').find('.tip-arrow-bottom');
									arrowbottom.css({
										left:'5%'
									});
								});
							});
							return "<img src='/img/loading.gif' />";
						}
					},
					showOn : 'hover',
					alignTo: 'target',
					alignX: 'inner-left',
					alignY: 'bottom',
					offsetX : 0,
					offsetY : 5,
					showTimeout : 600,
					fade : false,
					slide : false
				};
			return target.poshytip(opt);
		},
		/**
		 * 显示讨论区技术问答版块非软件标签介绍
		 */
		show_tag_introduce_other:function(){
			var target = $(".tag.other");
			var opt = {
					className : 'tip-yellowsimple question-tag',
					content : function(updateShow){
						var tagId = $(this).data('id');
						if(tagId){
							setTimeout(function(){
								ajax_post("/action/ajax/tag_introduce","tag="+tagId+"&type=other",function(data){
									updateShow(data);
									var arrowtop = $('.question-tag').find('.tip-arrow-top');
									arrowtop.css({
										left:'5%'
									});
									var arrowbottom = $('.question-tag').find('.tip-arrow-bottom');
									arrowbottom.css({
										left:'5%'
									});
								});
							});
							return "<img src='/img/loading.gif' />";
						}
					},
					showOn : 'hover',
					alignTo: 'target',
					alignX: 'inner-left',
					alignY: 'bottom',
					offsetX : 0,
					offsetY : 5,
					showTimeout : 600,
					fade : false,
					slide : false
				};
			return target.poshytip(opt);
		},
		close_recommend:function(){
			if(confirm("确认关闭城市圈推荐提醒？")){
				jQuery.post("/action/group/close_recommend",function(){
					location.reload();
				});
				/*
				jQuery.cookie("noRmd",true,{
					domain:'.oschina.net',
					expires:365
				});
				location.reload();
				*/
			}
		},
		addModule : function(name, pt, auto_init) {
			if (isEmpty(pt)) {
				return;
			}
			osc[name] = pt;
			this.modules[name] = pt;
			if (auto_init)
				pt.init();
			return osc[name];
		},
		stop_poll_check : function(timer) {
			if (isEmpty(timer))
				timer = this.poll_timer;
			clearInterval(timer);
		},
		resize_trend_img : function(im, size, only_limit_width) {
			if (typeof size == "undefined")
				size = 120;
			if (im.width > size) {
				im.width = size;
			} else if (im.height > size && !only_limit_width) {
				im.height = size;
			}
		},
		resize_img_height : function(image, height) {
			if (typeof height == "undefined") {
				height = 100;
			}
			if (image.height > height) {
				image.height = height;
			}
		},
		adjust_album_image : function(img, width, height) {
			var h = img.height;
			var w = img.width;
			if (h < height && w < width) {
				$(img).css("margin", (height - h) / 2 + "px " + (width - w) / 2 + "px");
			} else if (h < height && w >= width) {
				h = h * width / w;
				$(img).css({
					"margin" : (height - h) / 2 + "px 0px",
					"width" : width
				});
			} else if (w < width && h >= height) {
				w = w * height / h;
				$(img).css({
					"margin" : "0px " + (width - w) / 2 + "px",
					"height" : height
				});
			} else {
				h = h * width / w;
				$(img).css({
					"margin-top" : (height - h) / 2 + "px",
					"width" : width
				});
			}
		},
		enable_video_full_sreen : function() {
			$("embed").attr("allowfullscreen", true);
		},
		set_cursor_end : function(obj) {
			var esrc = document.getElementById(obj);
			if (esrc == null) {
				esrc = event.srcElement;
			}
			var rtextRange = esrc.createTextRange();
			rtextRange.moveStart('character', esrc.value.length);
			rtextRange.collapse(true);
			rtextRange.select();
		},
		_filter_script_tags : function(str) {
			return str ? str.replace(/(<script[^>]*>(.|\n)*?<\/script>)/ig, '') : '';
		},
		_replace_html_tags : function(str) {
			if (!str)
				return '';
			str = str.replace(/</ig, '&lt;');
			str = str.replace(/>/ig, '&gt;');
			return str;
		}
	};

	return osc.init();
})(window);
var scrolltotop = osc.addModule('scrolltotop', {
	setting : {
		startline : 1,
		scrollto : 0,
		scrollduration : 80,
		fadeduration : [ 500, 100 ]
	},
	controlHTML : '<img src="/img/gotop.gif" style="width:31px; height:31px;" />',
	controlattrs : {
		offsetx : 100,
		offsety : 165
	},
	anchorkeyword : '#top',
	state : {
		isvisible : false,
		shouldvisible : false
	},

	scrollup : function() {
		if (!this.cssfixedsupport)
			this.$control.css({
				opacity : 0
			})
		var dest = isNaN(this.setting.scrollto) ? this.setting.scrollto : parseInt(this.setting.scrollto)
		if (typeof dest == "string" && jQuery('#' + dest).length == 1)
			dest = jQuery('#' + dest).offset().top
		else
			dest = 0
		this.$body.animate({
			scrollTop : dest
		}, this.setting.scrollduration);
	},

	keepfixed : function() {
		var $window = jQuery(window)
		var controlx = $window.scrollLeft() + $window.width() - this.$control.width() - this.controlattrs.offsetx
		var controly = $window.scrollTop() + $window.height() - this.$control.height() - this.controlattrs.offsety
		this.$control.css({
			left : controlx + 'px',
			top : controly + 'px'
		})
	},

	togglecontrol : function() {
		var scrolltop = jQuery(window).scrollTop()
		if (!this.cssfixedsupport)
			this.keepfixed()
		this.state.shouldvisible = (scrolltop >= this.setting.startline) ? true : false
		if (this.state.shouldvisible && !this.state.isvisible) {
			this.$control.stop().show();
			this.state.isvisible = true
		} else if (this.state.shouldvisible == false && this.state.isvisible) {
			this.$control.stop().hide();
			this.state.isvisible = false
		}
	},
	offset : function(x, y) {
		scrolltotop.controlattrs.offsetx = x;
		scrolltotop.controlattrs.offsety = y;
	},
	init : function() {
		jQuery(document).ready(function($) {
			var mainobj = scrolltotop
			var iebrws = document.all
			mainobj.cssfixedsupport = !iebrws || iebrws && document.compatMode == "CSS1Compat" && window.XMLHttpRequest
			mainobj.$body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body')
			mainobj.$control = $('<div id="topcontrol">' + mainobj.controlHTML + '</div>').css({
				position : mainobj.cssfixedsupport ? 'fixed' : 'absolute',
				bottom : mainobj.controlattrs.offsety,
				right : mainobj.controlattrs.offsetx,
				display : 'none',
				cursor : 'pointer'
			}).attr({
				title : '回到顶部'
			}).click(function() {
				mainobj.scrollup();
				return false
			}).appendTo('body')
			if (document.all && !window.XMLHttpRequest && mainobj.$control.text() != '')
				mainobj.$control.css({
					width : mainobj.$control.width()
				})
			mainobj.togglecontrol()
			$('a[href="' + mainobj.anchorkeyword + '"]').click(function() {
				mainobj.scrollup()
				return false
			})
			$(window).bind('scroll resize', function(e) {
				mainobj.togglecontrol()
			})
		})
	}
});
$(function() {
	osc.show_tips();
	osc.enable_video_full_sreen();
});
$.fn.setCursorPosition = function(position){
    if(this.lengh == 0) return this;
    return $(this).setSelection(position, position);
}

$.fn.setSelection = function(selectionStart, selectionEnd) {
    if(this.lengh == 0) return this;
    input = this[0];

    if (input.createTextRange) {
        var range = input.createTextRange();
        range.collapse(true);
        range.moveEnd('character', selectionEnd);
        range.moveStart('character', selectionStart);
        range.select();
    } else if (input.setSelectionRange) {
        input.focus();
        input.setSelectionRange(selectionStart, selectionEnd);
    }

    return this;
}

$.fn.focusEnd = function(){
    this.setCursorPosition(this.val().length);
}