
<meta charset="utf-8">
<title>SiBaDaC</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="/sibadac/assets/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 20px;
	padding-bottom: 60px;
}

/* Custom container */
.container {
	margin: 0 auto;
	max-width: 1000px;
}

.container>hr {
	margin: 60px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
	margin: 80px 0;
	text-align: center;
}

.jumbotron h1 {
	font-size: 100px;
	line-height: 1;
}

.jumbotron .lead {
	font-size: 24px;
	line-height: 1.25;
}

.jumbotron .btn {
	font-size: 21px;
	padding: 14px 24px;
}

/* Supporting marketing content */
.marketing {
	margin: 60px 0;
}

.marketing p+h4 {
	margin-top: 28px;
}

/* Customize the navbar links to be fill the entire space of the .navbar */
.navbar .navbar-inner {
	padding: 0;
}

.navbar .nav {
	margin: 0;
	display: table;
	width: 100%;
}

.navbar .nav li {
	display: table-cell;
	width: 1%;
	float: none;
}

.navbar .nav li a {
	font-weight: bold;
	text-align: center;
	border-left: 1px solid rgba(255, 255, 255, .75);
	border-right: 1px solid rgba(0, 0, 0, .1);
}

.navbar .nav li:first-child a {
	border-left: 0;
	border-radius: 3px 0 0 3px;
}

.navbar .nav li:last-child a {
	border-right: 0;
	border-radius: 0 3px 3px 0;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.btn.btn-sm.payment {
	padding-top: 8px;
	padding-right: 8px;
	padding-bottom: 8px;
	padding-left: 8px;
	font-size: 15px;
}

</style>

<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	window.setTimeout(function() {
	    $(".alert-success").fadeTo(1500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 5000); 
});
</script>


<script type="text/javascript">
$(document).ready(function () {
    $(".unsubscribe-table-button").click(function(){
		if(confirm("Esta seguro que desea eliminar esta subscripcion?")) {
			$("#unsubscribe-table-service")[0].value = $(this).data('value');
			$("#unsubscribe-table-form").submit();
		}
	});
});
</script>

<link href="/sibadac/assets/css/bootstrap-responsive.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="/sibadac/assets/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/sibadac/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/sibadac/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/sibadac/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/sibadac/assets/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="/sibadac/assets/ico/favicon.png">
