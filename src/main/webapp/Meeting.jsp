<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meeting</title>
<link rel="stylesheet" type="text/css" href="CSS/myStyle.css" />
<script type="text/javascript" src="https://flashphoner.com/downloads/builds/flashphoner_client/wcs_api-2.0/current/flashphoner.js"></script>
<script type="text/javascript" src="scripts/screen-sharing-min.js"></script>
<style>
.message{
	background: white;
	padding: 200px;
	margin: 100px 0 0 0;
	text-align: left;
	overflow:auto;
	}
.textarea {
	background: white;
	padding: 8px;
	margin: 0 0 0 300px;
	text-align: center;
}
.video {
	background: black;
	height: 400px;
	width: 800px;
	margin: 100px 0 0 200px;
	text-align: center;
}
.general {
	display: flex;
	flex-direction: row;
}
.button {
	margin: 10px 0px 0 500px;
	height: 30px;
	width: 200px;
}
</style>
</head>
<body onload="init_api()">
<h1>Welcome</h1>
<div class="general">
<div class="video">
<div id="screen-sharing"></div>
</div>
<div class="message">
</div>
</div>
<div class="general">
<button class="button" id="shareBtn">Share Screen</button>
<textarea class="textarea" id="w3review" name="w3review" rows="4" cols="50">
</textarea>
<button>Send</button>
</div>
</body>
</html>