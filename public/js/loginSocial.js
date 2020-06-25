$( document ).ready(function() {
    document.getElementById("token_fb").value = "";
    document.getElementById("fb_id").value = "";   
    document.getElementById('status').innerHTML = "";
    document.getElementById("mail_fb").value = "";
    document.getElementById("name_fbb").value = "";
    document.getElementById("token_fb_l").value = "";
    document.getElementById("fb_id_l").value = "";   
    document.getElementById('status_l').innerHTML = "";
    document.getElementById("mail_fb_l").value = "";
    document.getElementById("name_fbb_l").value = "";
    document.getElementById("id_goo").value = "";
    document.getElementById("name_goo").value = "";
    document.getElementById("imageurl_goo").value = "";
    document.getElementById("email_goo").value = "";
    document.getElementById("token_goo").value = "";
    document.getElementById("id_goo_l").value = "";
    document.getElementById("name_goo_l").value = "";
    document.getElementById("imageurl_goo_l").value = "";
    document.getElementById("email_goo_l").value = "";
    document.getElementById("token_goo_l").value = "";

});


/*
 * Login y registro Facebook
 */
window.fbAsyncInit = function() {
    FB.init({
        appId      : "2250560375012732",
        xfbml      : true,
        version    : 'v2.12'
    });

    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            document.getElementById('status').innerHTML = 'Usuario Logeado.';
            document.getElementById('status_l').innerHTML = 'Usuario Logeado.';
            document.getElementById("token_fb").value = response.authResponse.accessToken;
            document.getElementById("token_fb_l").value = response.authResponse.accessToken;
            document.getElementById("fb_id").value = response.authResponse.userID;
            document.getElementById("fb_id_l").value = response.authResponse.userID;
        } else if (response.status === 'not_authorized') {
            document.getElementById('status').innerHTML = 'No se pudo iniciar sesión1.';
            document.getElementById('status_l').innerHTML = 'No se pudo iniciar sesión1.';
        } else {
            document.getElementById('status').innerHTML = 'No se pudo iniciar sesión2';
            document.getElementById('status_l').innerHTML = 'No se pudo iniciar sesión2';
        }
    });
};

(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
} (document, 'script', 'facebook-jssdk'));



function login() {
    FB.login(function(response) {
        if (response.status === 'connected') {
            document.getElementById('status').innerHTML = 'Usuario Logeado.';
            document.getElementById('status_l').innerHTML = 'Usuario Logeado.';
            getInfo();
            document.getElementById("token_fb").value = response.authResponse.accessToken;
            document.getElementById("token_fb_l").value = response.authResponse.accessToken;
             
            FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                    document.getElementById('status').innerHTML = 'Usuario Logeado.';
                    document.getElementById('status_l').innerHTML = 'Usuario Logeado.';
                    getInfo();
                    document.getElementById("token_fb").value = response.authResponse.accessToken;
                    document.getElementById("token_fb_l").value = response.authResponse.accessToken;
                }
            });

            if(document.getElementById("mail_fb").value != "" || document.getElementById("mail_fb").value == undefined ){
                document.getElementById("login-fb").submit();
            } else {
                getInfo();             
            }
            if(document.getElementById("mail_fb_l").value != "" || document.getElementById("mail_fb_l").value == undefined ){
                document.getElementById("login-fb_l").submit();
            } else {
                getInfo();             
            }
        } else if (response.status === 'not_authorized') {
            document.getElementById('status').innerHTML = 'No está autorizado.';
            document.getElementById('status_l').innerHTML = 'No está autorizado.';
        } else {
            document.getElementById('status').innerHTML = 'No se ha podido iniciar sesión';
            document.getElementById('status_l').innerHTML = 'No se ha podido iniciar sesión';
        }
    }, {scope: 'email'});
}


function getInfo(){
    FB.api('/me', { locale: 'en_US', fields: 'name, email' },
        function(response) {
            console.log(response);
            if(response.email && response.name) {
                document.getElementById("mail_fb").value = response.email;
                document.getElementById("mail_fb_l").value = response.email;
                document.getElementById("name_fbb").value = response.name;
                document.getElementById("name_fbb_l").value = response.name;
            }
            if(document.getElementById("mail_fb").value == response.email){
                var formulario = document.getElementById("login-fb");
                formulario.submit();
            }
            if(document.getElementById("mail_fb_l").value == response.email){
                var formulario = document.getElementById("login-fb_l");
                formulario.submit();
            }
        }
    );
}



//Login y registro con google

var googleUser = {};

var startApp = function() {
    gapi.load('auth2', function(){
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
            client_id: '987905943046-4ontogsunl345kj91hocls3g50ateia9.apps.googleusercontent.com',
            cookiepolicy: 'single_host_origin',
            // Request scopes in addition to 'profile' and 'email'
            //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('my-signin'));
        attachSignin2(document.getElementById('my-signin2'));
    });
};


function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
            var profile = googleUser.getBasicProfile();
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
            if(id_token){
                document.getElementById("id_goo_l").value = profile.getId();
                document.getElementById("name_goo_l").value = profile.getName();
                document.getElementById("imageurl_goo_l").value = profile.getImageUrl();
                document.getElementById("email_goo_l").value = profile.getEmail();
                document.getElementById("token_goo_l").value = googleUser.getAuthResponse().id_token;
                localStorage.setItem("loginGoogle", true);
                document.getElementById("log-go_l").submit();
            }
        }, function(error) {
            // alert(JSON.stringify(error, undefined, 2));
        });
}

function attachSignin2(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
            var profile = googleUser.getBasicProfile();
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
            if(id_token){
                document.getElementById("id_goo").value = profile.getId();
                document.getElementById("name_goo").value = profile.getName();
                document.getElementById("imageurl_goo").value = profile.getImageUrl();
                document.getElementById("email_goo").value = profile.getEmail();
                document.getElementById("token_goo").value = googleUser.getAuthResponse().id_token;
                localStorage.setItem("loginGoogle", true);
                document.getElementById("log-go").submit();
            }
        }, function(error) {
            // alert(JSON.stringify(error, undefined, 2));
        });
}


$('.singoff').click(function(e){
	if(localStorage.loginGoogle == true) {
		e.preventDefault();
		document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=https://almagrario.logisticappweb.com/session/end";
		localStorage.removeItem('loginGoogle');
	}
	
});

function onLogIn() {
    $('.abcRioButtonContentWrapper').click();
    const googleUser = gapi.auth2.getAuthInstance().currentUser.get();
    var profile = googleUser.getBasicProfile();
    //console.log(profile);
    document.getElementById("id_goo").value = profile.getId();
    document.getElementById("name_goo").value = profile.getName();
    document.getElementById("imageurl_goo").value = profile.getImageUrl();
    document.getElementById("email_goo").value = profile.getEmail();
    document.getElementById("token_goo").value = googleUser.getAuthResponse().id_token;
    document.getElementById("log-go").submit();
}   
