$(document).ready(function () {
	
	if (document.getElementById("mostrar_modal").value == 'login_failure'){
		$("#myModal").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'session_close'){
		$("#myModal1").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'forgot_password_success'){
		$("#myModal2").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'change_password_success'){
		$("#myModal3").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'change_password_failure'){
		$("#myModal4").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'add_address_success'){
		$("#add_success").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'add_address_failure'){
		$("#add_failure").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'delete_address_success'){
		$("#delete_success").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'delete_address_failure'){
		$("#delete_failure").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}	

	if (document.getElementById("mostrar_modal").value == 'email_contact_success'){
		alert("test");
		$("#contact_success").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}

	if (document.getElementById("mostrar_modal").value == 'email_contact_failure'){
		$("#contact_failure").modal("show");
		document.getElementById("mostrar_modal").value = "";
	}		
});
