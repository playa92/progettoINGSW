<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<jsp:useBean id="prenotato" class="model.Prenotazione" scope="session" />
	<jsp:setProperty name="prenotato" property="id_visita" value="fin."/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Visualizza prenotazioni</title>
	<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/jquery/jquery-3.2.1.min.js"></script>
	<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="../js/effects.js"></script>
	<script src="../js/scroll_up.js"> </script>
	
	<style>
	.button {
	  display: inline-block;
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	  width: 120px;
	  height: 42px;
	  cursor: I-beam;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	  padding: 0 20px;
	  overflow: hidden;
	  border: 1px solid white;
	  -webkit-border-radius: 21px;
	  border-radius:10px;
	  font: normal 20px/normal "Antic", Helvetica, sans-serif;
	  color: rgba(140, 140, 140, 1);
	  text-decoration: normal;
	  -o-text-overflow: ellipsis;
	  text-overflow: ellipsis;
 	  background: white; 
	  -webkit-box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.5) inset;
	  box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.5) inset;
	  -webkit-transition: all 502ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  -moz-transition: all 502ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  -o-transition: all 502ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  transition: all 502ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	}
		
	.button:focus {
	  width: 490px;
/* 	  cursor: default; */
	  padding: -13px 20px 0;
	  
	  color: #092147;
/* 	  background: #092147; */
	  -webkit-transition: all 601ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  -moz-transition: all 601ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  -o-transition: all 601ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  transition: all 601ms cubic-bezier(0.68, -0.75, 0.265, 1.75);
	  box-shadow: 0 0 2px 2px #092147;
	  
	}
		
	input:focus {
	  outline: none;
	}
	
	body {
	   background-attachment: fixed;
	}
	</style>
</head>

<body style="height:1150px">

	<!-- Navbar -->
	<nav role="navigation" role="navigation" class="navbar">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="dropdown nav-item">
					<a id="navbar-text" class="nav-link dropdown-toggle" href="../home"><span class="glyphicon glyphicon-home"></span> Home</a>
			     </li>
	   		</ul> 
		</div>	
	</nav>
	
	<div class="jumbotron text-center">
		<jsp:getProperty name="prenotato" property="id_visita"/>
		<h1>Elenco Prenotati</h1>
	</div>
	
	  <!-- SEARCHBAR-->
	  <div align="center"><br><br><br>
	  	<input id="search" class="button" placeholder="Cerca..." />
	  </div>
	
	
  	<table id="table" class="table-responsive">
  	<thead class="thead-default">
    	<tr>
	        <th>#</th>
	      	<th>Nome</th>
	      	<th>Cognome</th>
	      	<th>Orario Visita</th>
    	</tr>
  	</thead>
  	<tbody id="elencoPrenotati">
   
	  	<c:forEach var="prenotato" items="${prenotazioni}">
			<tr class="prenotati">
				<td>${prenotato.nome}</td>
				<td>${prenotato.cognome}</td>
				<td>${prenotato.orarioVisita }</td>
			</tr>			
		</c:forEach>
   
  </tbody>
</table>



	<script>
	$(document).ready(function(){
		var $rows = $('#table tr');
		$('#search').keyup(debounce(function() {
		    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
		    
		    $rows.show().filter(function() {
		        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
		        return !~text.indexOf(val);
		    }).hide();
		}, 300));
	
		function debounce(func, wait, immediate) {
			var timeout;
			return function() {
				var context = this, args = arguments;
				var later = function() {
					timeout = null;
					if (!immediate) func.apply(context, args);
				};
				var callNow = immediate && !timeout;
				clearTimeout(timeout);
				timeout = setTimeout(later, wait);
				if (callNow) func.apply(context, args);
			};
		};
	})
	
	</script>
 
	<!-- SCROLLING -->
	<a href="#" class="scrollup">Scroll</a>
	
</body>
</html>