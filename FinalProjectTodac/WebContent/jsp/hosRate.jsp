<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$('#injectBtn').on('click',function(){
		$.ajax({
			url : 'rateinfo.do',
			data : {
				
			},
			type : 'post',
			success : function(){
				
			}
		});
		
		
		
		
	});
	
	
	
});

</script>





</head>
<body>
<h1>����������</h1>
<hr>
    <div class="container">
<div class="row">
<div class="col-md-4"></div>
</div>

<div class="row">
	  <div class="col-md-4">
  	</div>
    	<div class="col-md-4" style="background-color:lavender;">
    
					<label>
						<input type="checkbox" name="check" value="0" checked> <span class="label-text">��ü</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="1"> <span class="label-text">1���</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="2"> <span class="label-text">2���</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="3"> <span class="label-text">3���</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="4"> <span class="label-text">4���</span>
					</label>
	    </div>
  		<div class="col-md-4"></div>
    	<div class="col-md-4"></div>
    	<div class="col-md-4" style="background-color:lavenderblush;"></div>
</div>
  <div class="row">
		<div class="col-md-1">
      <label for="sel1">��/��</label>
      <select class="form-control" id="sel1">
        <option value="">1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
      </select>
 	 </div>
	<div class="col-md-1">
      <label for="sel1">��/��/��</label>
      <select class="form-control" id="sel2">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
      </select>
	<input id="hname" type="text">
  <button id="search" class="btn btn-default">�˻�</button>
	</div>
  </div>
  <hr>
  <div class="container">
  <button id="injectBtn"> <span class="btn btn-default">�ֻ���ó���</span></button>
  <button id="antiBtn" class="btn btn-default">�׻���ó���</button>
  <button id="opBtn" class="btn btn-default">������ ������ �׻���</button>
  <button id="costBtn" class="btn btn-default">ó���ǰ��</button>
  </div>
  <hr>
  <div class="row">
  
  
  <table class="table table-striped">
    <thead>
      <tr>
        <th>NO.</th>
        <th>�����̸�</th>
        <th>���׸�</th>
        <th>�򰡵��<a>��</a><a>��</a></th>
        <th>������</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
  
  
  
  
  
  
  
  
  
  
  
</div>

</body>
</html>