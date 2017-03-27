

function picType(imageName) {
	var lastname = imageName.substring(imageName.lastIndexOf("."),
			imageName.length);
	var types = new Array(".jpg", ".jpeg", ".png", ".gif", ".bmp");
	// 验证上传文件格式是否正确
	for (var i = 0; i < types.length; i++) {
		if (lastname.toLowerCase() == types[i]) {
			alert("OK");
		}
	}
}