function check(fn){
	//Lấy thông tin đăng nhập
	var username = fn.Taikhoan.value;
	var userpass = fn.Matkhau.value;
	
	//Biến xác nhận sự hợp lệ cho giá trị
	var validUserName = true;
	var validUserPass = true;
	
	//Biến lữu trữ thông báo
	var message = "";
	
	//Kiểm tra tên đăng nhập
	if(username.trim()==""){
		validUserName = false;
		message = "Tài khoản không được để trống <br/>";
	}else{
		username = username.trim();
		
		if(username.indexOf(" ")!=-1){
			validUserName = false;
			message  += "Tài khoản không được có dấu cách <br/>";
		}else if(username.length>50){
			validUserName = false;
			message += "Tài khoản quá dài <br/>";
		}
	}
	
	//Kiểm tra mật khẩu
	if(userpass.trim()==""){
		validUserPass = false;
		message += "Mật khẩu không được để trống <br/>";
	}else if(userpass.length<2){
		validUserPass = false;
		message += "Mật khẩu không hợp lệ <br/>";	
	}
	 document.getElementById("check").innerHTML = message;
	//Xuất thông báo nếu có
	
	//Trả về kết quả kiểm tra
	return validUserName && validUserPass;
}

