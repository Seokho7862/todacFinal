<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">

.no-drag {-ms-user-select: none; -moz-user-select: -moz-none;
 -webkit-user-select: none; -khtml-user-select: none; user-select:none;}
.text_blur {
   color: transparent;
   text-shadow: 0 0 5px rgba(0,0,0,0.5);
}
</style>
</head>
<body>

<div class="container mt-3 no-drag text_blur">
  <h2>Centered Modal Example</h2>
  <p class="text_blur no-drag">Center the modal vertically and horizontally within the page, with the .modal-dialog-centered class.</p>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal" >
    <div class="modal-dialog modal-dialog-centered" >
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <p class="text_blur">
          Modal body..
        </p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

<hr>

<table>
<thead>
<tr>
<th>아이디</th>
<th>병원명</th>
<th>사업자번호</th>
<th>사업자번호</th>
<th colspan="2">승인여부</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
<input type="time" value="00:00">
</body>
</html>