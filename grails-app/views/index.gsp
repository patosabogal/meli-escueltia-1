<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Meli</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #ff9e00;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}
			
			.button {
			    background-color:#9370DB;
			    border: none;
			    color: white;
			    padding: 15px 32px;
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size: 16px;
			    margin: 4px 2px;
			    cursor: pointer;
			    weight: 40px;
			    heigh: 20px;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}
			
			#divBuscar {
			    position:relative;
			    float:left;
			   	font-family: verdana;
			    padding-left: 10px;
			}
			#divBotonesExtra {
			    position:relative;
			    float:right;
			   	font-family: verdana;
			    padding-left: 10px;
			}
			
			#inputText{
				border: 2px solid #E0E0E0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	
		<div align="center">
			<h1><p>¡Bienvenido a Meli ${mail}!</p></h1>
		</div>
		
		<div align="center" class="box">
			
			<g:if test="${texto != 'Logueado'}">
				<g:form action="login" controller="login" method="POST">
					Mail
					<input type="text" name="mail">
					<g:set var = "mailUsuario" value = "${mail}" scope = "session"/>
					
					Password: 
					<input type="password" name="password"> <br>
					<button type="submit">Log In</button>
				</g:form>
				<g:if test="${texto== 'Password Invalido'}">
					 <font color="red">Contraseña Invalida</font> 
				</g:if>
				<g:if test="${texto== 'Email no esta registrado'}">
					 <font color="red">Email no esta registrado</font> 
	
			
				</g:if>
			</g:if>
			<g:else>
				
				<div id="divBuscar" >
					<g:form action="index" controller="busqueda" method="POST" >
						<input type="text" name="busqueda">
						<input type="hidden" name="usuario" value="${mail}">
						<button  type="submit">Busqueda</button>
						<br>
						<font color="black">Usado</font> 
						<g:checkBox name = "usado"/>
						<font color="black">Nuevo</font> 
						<g:checkBox name = "nuevo"/>	
					</g:form>
				</div>
				
				
			</g:else>
		</div>
	</body>
</html>
