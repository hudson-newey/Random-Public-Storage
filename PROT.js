<!--yakzyo.com Anti Hack-->
<script>
	function secureeditor(o){
	if(document.getElementById("wpadminbar")){
    YakzyoBeats("http://www.yakzyo.com/wp-admin/?secure=1");
} else {
    alert("Invalid Credentials");
window.location.replace("http://www.yakzyo.com/sipcro/security-testing/");
}
	}
</script>
<h3>Protected by yakzyo.com <a onclick="secureeditor();" style="color:#adb2b7">PROT</a></h3>
<script>
// Functions
function delete_cookie(name) {
  document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
}
function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    } else {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    return decodeURI(dc.substring(begin + prefix.length, end));
}
	// PROT (Password-Rooting-of-Output-Text)
// check if the user opted out of PROT (Password-Rooting-of-Output-Text) if so take them back
	if (window.location != "http://www.yakzyo.com/sipcro/security-testing/" && window.location != "http://www.yakzyo.com/u/pb/" && window.location != "http://www.yakzyo.com/u/tb/") {
	var myCookie = getCookie("Verified");
if (myCookie=="1") { window.location.replace("http://www.yakzyo.com/sipcro/security-testing/");
}
		// check if the person has got any bans
	var myCookie = getCookie("yakzyo.com-Anti-Hack");
if (myCookie=="Jjtj4SKgrp3BPW3JLctw1dwAmqkaoap22jGmKsGd[TEMP BAN]") { window.location.replace("http://www.yakzyo.com/u/tb/");
}
if (myCookie=="lbSsujzgTfzo9kNul5u1TkmtVdU5New3v9mD9IH8[PERM BAN]") { window.location.replace("http://www.yakzyo.com/u/pb/");
}
			// check if the user has cookies enabled
var cookie_name = 'yakzyo.com-Anti-Hack-active';
delete_cookie(cookie_name);
document.cookie = "yakzyo.com-Anti-Hack-active=U7cY0byfuTO13FzVp5gfR7BZZQ23UIlgIGs6reyIRlitVoTNvCKJnD0wS0VV; path=/";
	var active = getCookie("yakzyo.com-Anti-Hack-active");
	if (active != "U7cY0byfuTO13FzVp5gfR7BZZQ23UIlgIGs6reyIRlitVoTNvCKJnD0wS0VV") { window.location.replace("http://www.yakzyo.com/u/tb/"); }
	}
	// check the user flags
	var flags = getCookie("yakzyo.com-Anti-Hack-flags");
	if(flags=="111111111"){ window.location.replace("http://www.yakzyo.com/u/tb"); }
</script>