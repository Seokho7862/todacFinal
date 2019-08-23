<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



<script type="text/javascript">
$(function(){
	
$('.list-group').hide();



$('.panel-heading').click(function(){
	$(this).parents('div.panel').find('ul.list-group').slideToggle();

});
});
</script>

</head>
<body>



<div class="jumbotron text-center text-light" style="margin-bottom:0">
   <div class="container">
    <h1 style="font-family: 'Jua'; color: white">MY PAGE</h1>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p><a class="btn btn-primary btn-lg" role="button" style="font-family: 'Jua'; color: white">HOME&raquo;</a></p>
  </div>
</div>


<!--     <div class="col-sm-4">
   
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div> -->



</body>
</html>