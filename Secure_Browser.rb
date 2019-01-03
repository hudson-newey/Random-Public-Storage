#!/usr/bin/ruby
=begin
Labyrinth Copyright (C) 2018 Grathium Sofwares <grathiumsoftwears@gmail.com>
This program comes with ABSOLUTELY NO WARRANTY
This is a free software, and you are welcome to redistribute it under certain
conditions.
=end

require 'webrick'
require 'webrick/https'

cert_name = [
  %w[CN localhost],
]

server = WEBrick::HTTPServer.new(
    :Port => 8443,
    :SSLEnable => true,
    :SSLCertName => cert_name
)

server.mount_proc '/CzzveexUHcn1N.lab' do |req, res|
  res.body = '  <!doctype html>

<html>
<head>
<title>Encrpyred Search</title>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}
li {
  float: left;
}
li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: #111;
}
h1#top-message {
	position: absolute;
	left: 41%;
	top: -18px;
}
html {
	background-repeat: no-repeat;
	background-size: contain;
	background-size: 100%;
}
iframe {
	position: absolute;
	border: none;
	width:100%;
	height: 90%;
}
iframe:focus {
  outline: none;
}
iframe[seamless] {
  display: block;
}
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: #323232;
  color: white;
  text-align: center;
}
html, body {margin: 0; height: 100%; overflow: hidden}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown {
	position: absolute;
	top: 14px;
	color: white;
	padding-left: 18px;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #2f2f2f;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 1px 16px;
  z-index: 1;
  color: #D3D3D3;
    border-top: solid;
  border-width: 1px;
  border-top-color: #A9A9A9;
}
.dropdown:hover .dropdown-content { display: block; }
.dropdown-item:hover {
	background-color: black;
}
p a {
  display: block;
  color: #D9D9D9;
  text-align: left;
  text-decoration: none;
}
p a:hover {
	color: white;
}
</style>

<h1 id="top-message" style="color:#f2f2f2">[Encrpyred Search]</h1>

 <ul><u>
  <li><a href="#" onclick="home();">Home</a></li>
</ul></u>
<head>

<body>
<iframe id="uvKfjbuR9RqZiQthWuef" style="position: absolute;width:100%;height:95.2%;left:0px;" class="viewbox" src="https://www.bing.com"></iframe>
</body>

<script>
function home() {
document.getElementById("uvKfjbuR9RqZiQthWuef").src = "https://www.bing.com";
}
</script>
</html>'
end

system "cls"
puts "Client Ready!"
system 'start chrome.exe --incognito "https://localhost:8443/CzzveexUHcn1N.lab"'
server.start