function rotate(btn, target, degree){
	if(navigator.userAgent.indexOf("MSIE")==-1||navigator.userAgent.indexOf("MSIE 10")>0){
		var value = "matrix(1, 0, 0, 1, 0, 0)";
		var type = "transform:";
		var img = $(btn).parent().parent().find("img");
		var height = img.height();
		var width = img.width();
		var imgtop = 0;
		var imgleft = 0;
		var containerwidth = width;
		var containerheight = height;
		if(height>=width){
			switch(degree){
				case 0:value="matrix(0, 1, -1, 0, 0, 0)";$(img).attr("height", width);$(img).attr("width", width*width/height);imgleft=parseInt(img.attr("height"));imgtop=0;containerheight=$(img).attr("width");containerwidth=parseInt($(img).attr("height"));break;
				case 1:value="matrix(-1, 0, 0, -1, 0, 0)";$(img).attr("width", height);$(img).attr("height", height*height/width);imgleft=parseInt(img.attr("width"));imgtop=$(img).attr("height");containerheight = $(img).attr("height");containerwidth=parseInt($(img).attr("width"));break;
				case 2:value="matrix(0, -1, 1, 0, 0, 0)";$(img).attr("height", width);$(img).attr("width", width*width/height);imgtop=img.attr("width");containerheight=$(img).attr("width");containerwidth=parseInt($(img).attr("height"));break;
				case 3:value="matrix(1, 0, 0, 1, 0, 0)";$(img).attr("width", height);$(img).attr("height", height*height/width);containerheight = $(img).attr("height");containerwidth=parseInt($(img).attr("width"));break;
			}
		}else{
			switch(degree){
			case 0:value="matrix(0, 1, -1, 0, 0, 0)";imgleft=height;imgtop=0;containerheight=width;containerwidth=height;break;
			case 1:value="matrix(-1, 0, 0, -1, 0, 0)";imgleft=width;imgtop=height;containerheight=height;containerwidth=width;break;
			case 2:value="matrix(0, -1, 1, 0, 0, 0)";imgtop=width;imgleft=0;containerheight=width;containerwidth=height;break;
			case 3:value="matrix(1, 0, 0, 1, 0, 0)";containerheight=height;containerwidth=width;break;
			}
		}
		if($(btn).parent().parent().find("#img_container").length!=0){
			$(btn).parent().parent().find("#img_container").replaceWith(img);
		}
		$(img).wrap("<div id='img_container' style='position:relative;height:"+containerheight+"px;width:"+containerwidth+"px;'></div>");
		degree=degree+1;
		if(degree==4){
			degree = 0;
		}
		$(btn).attr("onclick", "rotate(this,\""+target+"\","+degree+");");
		var style = "transform-origin:0 0;-webkit-transform-origin:0 0;-ms-transform-origin:0 0;-moz-transform-origin:0 0;-o-transform-origin:0 0;transform:"+value+";-ms-transform:"+value+";-moz-transform:"+value+";-webkit-transform:"+value+";-o-transform:"+value+";position:absolute;top:"+imgtop+"px;left:"+imgleft+"px;"
		if($(img).css("max-width")){
			style = style + "max-width:" + $(img).css("max-width") + ";";
		}else{
			style = style + "max-width:425px;";
		}
		$(img).attr("style", style);
	}
}