
$(function(){
	
$('#sel1').change(function(){
	if($('#sel1').val()=='110000'){
		var addop = "";
		addop += "<option value='110001'>강남구</option>";
		addop += "<option value='110002'>강동구</option>";
		addop += "<option value='110024'>강북구</option>";
		addop += "<option value='110003'>강서구</option>";
		addop += "<option value='110004'>관악구</option>";
		addop += "<option value='110023'>광진구</option>";
		addop += "<option value='110005'>구로구</option>";
		addop += "<option value='110025'>금천구</option>";
		addop += "<option value='110022'>노원구</option>";
		addop += "<option value='110006'>도봉구</option>";
		addop += "<option value='110007'>동대문구</option>";
		addop += "<option value='110008'>동작구</option>";
		addop += "<option value='110009'>마포구</option>";
		addop += "<option value='110010'>서대문구</option>";
		addop += "<option value='110021'>서초구</option>";
		addop += "<option value='110011'>성동구</option>";
		addop += "<option value='110012'>성북구</option>";
		addop += "<option value='110018'>송파구</option>";
		addop += "<option value='110020'>양천구</option>";
		addop += "<option value='110013'>영등포구</option>";
		addop += "<option value='110014'>용산구</option>";
		addop += "<option value='110015'>은평구</option>";
		addop += "<option value='110016'>종로구</option>";
		addop += "<option value='110017'>중구</option>";
		addop += "<option value='110019'>중랑구</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='210000'){
		var addop = "";
		addop += "<option value='210012'>부산강서구</option>";
		addop += "<option value='210011'>부산금정구</option>";
		addop += "<option value='210100'>부산기장군</option>";
		addop += "<option value='210001'>부산남구</option>";
		addop += "<option value='210002'>부산동구</option>";
		addop += "<option value='210003'>부산동래구</option>";
		addop += "<option value='210005'>부산북구</option>";
		addop += "<option value='210015'>부산사상구</option>";
		addop += "<option value='210010'>부산사하구</option>";
		addop += "<option value='210006'>부산서구</option>";
		addop += "<option value='210014'>부산수영구</option>";
		addop += "<option value='210013'>부산연제구</option>";
		addop += "<option value='210007'>부산영도구</option>";
		addop += "<option value='210008'>부산중구</option>";
		addop += "<option value='210004'>부산진구</option>";
		addop += "<option value='210009'>부산해운대구</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='220000'){
		var addop = "";
		addop += "<option value='220100'>인천강화군</option>";
		addop += "<option value='220008'>인천계양구</option>";
		addop += "<option value='220006'>인천남동구</option>";
		addop += "<option value='220002'>인천동구</option>";
		addop += "<option value='220001'>인천미추홀구</option>";
		addop += "<option value='220003'>인천부평구</option>";
		addop += "<option value='220005'>인천서구</option>";
		addop += "<option value='220007'>인천연수구</option>";
		addop += "<option value='220200'>인천동진군</option>";
		addop += "<option value='220004'>인천중구</option>";
		$('#sel2').append(addop);
	}
	
	if($('#sel1').val()=='230000'){
		var addop = "";
		addop += "<option value='230001'>대구남구</option>";
		addop += "<option value='230007'>대구달서구</option>";
		addop += "<option value='230100'>대구달성군</option>";
		addop += "<option value='230002'>대구동구</option>";
		addop += "<option value='230003'>대구북구</option>";
		addop += "<option value='230004'>대구서구</option>";
		addop += "<option value='230005'>대구수성구</option>";
		addop += "<option value='230006'>대구중구</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='240000'){
		var addop = "";
		addop += "<option value='240004'>광주광산구</option>";
		addop += "<option value='240005'>광주남구</option>";
		addop += "<option value='240001'>광주동구</option>";
		addop += "<option value='240002'>광주북구</option>";
		addop += "<option value='240003'>광주서구</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='250000'){
		var addop = "";
		addop += "<option value='250002'>대전대덕구</option>";
		addop += "<option value='250004'>대전동구</option>";
		addop += "<option value='250003'>대전서구</option>";
		addop += "<option value='250001'>대전유성구</option>";
		addop += "<option value='250005'>대전중구</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='260000'){
		var addop = "";
		addop += "<option value='260001'>울산남구</option>";
		addop += "<option value='260002'>울산동구</option>";
		addop += "<option value='260004'>울산북구</option>";
		addop += "<option value='260100'>울산울주군</option>";
		addop += "<option value='260003'>울산중구</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='310000'){
		var addop = "";
		addop += "<option value='310001'>가평군</option>";
		addop += "<option value='311901'>고양덕양구</option>";
		addop += "<option value='311903'>고양일산동구</option>";
		addop += "<option value='311902'>고양일산서구</option>";
		addop += "<option value='311900'>과천시</option>";
		addop += "<option value='310100'>광명시</option>";
		addop += "<option value='312600'>광주시</option>";
		addop += "<option value='311000'>구리시</option>";
		addop += "<option value='311400'>군포시</option>";
		addop += "<option value='312300'>김포시</option>";
		addop += "<option value='311500'>남양주시</option>";
		addop += "<option value='310200'>동두천시</option>";
		addop += "<option value='310301'>부천소사구</option>";
		addop += "<option value='310300'>부천시</option>";
		addop += "<option value='310302'>부천오정구</option>";
		addop += "<option value='310403'>성남분당구</option>";
		addop += "<option value='310401'>성남수정구</option>";
		addop += "<option value='310402'>성남중원구</option>";
		addop += "<option value='310601'>수원권선구</option>";
		addop += "<option value='310604'>수원영통구</option>";
		addop += "<option value='310602'>수원장안구</option>";
		addop += "<option value='310603'>수원팔달구</option>";
		addop += "<option value='311700'>시흥시</option>";
		addop += "<option value='311101'>안산단원구</option>";
		addop += "<option value='311102'>안산상록구</option>";
		addop += "<option value='312400'>안성시</option>";
		addop += "<option value='310702'>안양동안구</option>";
		addop += "<option value='310701'>안양만안구</option>";
		addop += "<option value='312700'>양주시</option>";
		addop += "<option value='310009'>연천군</option>";
		addop += "<option value='311800'>오산시</option>";
		addop += "<option value='312001'>용인기흥구</option>";
		addop += "<option value='312002'>용인수지구</option>";
		addop += "<option value='312003'>용인처인구</option>";
		addop += "<option value='311600'>의왕시</option>";
		addop += "<option value='310800'>의정부시</option>";
		addop += "<option value='312100'>이천시</option>";
		addop += "<option value='312200'>파주시</option>";
		addop += "<option value='311200'>평택시</option>";
		addop += "<option value='312800'>포천시</option>";
		addop += "<option value='311300'>하남시</option>";
		addop += "<option value='312500'>화성시</option>";
		$('#sel2').append(addop);
	}
	if($('#sel1').val()=='320000'){
		var addop = "";
		addop += "<option value='320100'>강릉시</option>";
		addop += "<option value='320001'>고성군</option>";
		addop += "<option value='320200'>동해시</option>";
		addop += "<option value='320700'>삼척시</option>";
		addop += "<option value='320300'>속초시</option>";
		addop += "<option value='320004'>양구군</option>";
		addop += "<option value='320005'>양양군</option>";
		addop += "<option value='320006'>영월군</option>";
		addop += "<option value='320400'>원주시</option>";
		addop += "<option value='320008'>인제군</option>";
		addop += "<option value='320009'>정선군</option>";
		addop += "<option value='320010'>철원군</option>";
		addop += "<option value='320500'>춘천시</option>";
		addop += "<option value='320600'>태백시</option>";
		addop += "<option value='320012'>평창군</option>";
		addop += "<option value='320013'>홍천군</option>";
		addop += "<option value='320014'>화천군</option>";
		addop += "<option value='320015'>횡성군</option>";
		$('#sel2').append(addop);
	
	}
	if($('#sel1').val()=='330000'){
		var addop = "";
		addop += "<option value='330001'>괴산군</option>";
		addop += "<option value='330002'>단양군</option>";
		addop += "<option value='330003'>보은군</option>";
		addop += "<option value='330004'>영동군</option>";
		addop += "<option value='330005'>옥천군</option>";
		addop += "<option value='330006'>음성군</option>";
		addop += "<option value='330300'>제천시</option>";
		addop += "<option value='330011'>증평군</option>";
		addop += "<option value='330009'>진천군</option>";
		addop += "<option value='330101'>청주상당구</option>";
		addop += "<option value='330104'>청주서원구</option>";
		addop += "<option value='330103'>청주청원구</option>";
		addop += "<option value='330102'>청주흥덕구</option>";
		addop += "<option value='330200'>충주시</option>";
		$('#sel2').append(addop);
		
	}
	if($('#sel1').val()=='340000'){
		var addop = "";
		addop += "<option value='340800'>계룡시</option>";
		addop += "<option value='340300'>공주시</option>";
		addop += "<option value='340002'>금산군</option>";
		addop += "<option value='340700'>논산시</option>";
		addop += "<option value='340900'>당진시</option>";
		addop += "<option value='340400'>보령시</option>";
		addop += "<option value='340007'>부여군</option>";
		addop += "<option value='340600'>서산시</option>";
		addop += "<option value='340009'>서천군</option>";
		addop += "<option value='340500'>아산시</option>";
		addop += "<option value='340012'>예산군</option>";
		addop += "<option value='340012'>천안동남구</option>";
		addop += "<option value='340001'>천안서북구</option>";
		addop += "<option value='340014'>청양군</option>";
		addop += "<option value='340016'>태안군</option>";
		addop += "<option value='340015'>홍성군</option>";
		$('#sel2').append(addop);
		
	}
	if($('#sel1').val()=='350000'){
		var addop = "";
		addop += "<option value='350001'>고창군</option>";
		addop += "<option value='350100'>군산시</option>";
		addop += "<option value='350600'>김제시</option>";
		addop += "<option value='350200'>남원시</option>";
		addop += "<option value='350004'>무주군</option>";
		addop += "<option value='350005'>부안군</option>";
		addop += "<option value='350006'>순창군</option>";
		addop += "<option value='350008'>완주군</option>";
		addop += "<option value='350300'>익산시</option>";
		addop += "<option value='350010'>임실군</option>";
		addop += "<option value='350011'>장수군</option>";
		addop += "<option value='350402'>전주덕진구</option>";
		addop += "<option value='350401'>전주완산구</option>";
		addop += "<option value='350500'>정읍시</option>";
		addop += "<option value='350013'>진안군</option>";
		$('#sel2').append(addop);
		
	}
	if($('#sel1').val()=='360000'){
		var addop = "";
		addop += "<option value='360001'>강진군</option>";
		addop += "<option value='360002'>고흥군</option>";
		addop += "<option value='360003'>곡성군</option>";
		addop += "<option value='360700'>광양시</option>";
		addop += "<option value='360006'>구례군</option>";
		addop += "<option value='360200'>나주시</option>";
		addop += "<option value='360008'>담양군</option>";
		addop += "<option value='360300'>목포시</option>";
		addop += "<option value='360009'>무안군</option>";
		addop += "<option value='360010'>보성군</option>";
		addop += "<option value='360400'>순천시</option>";
		addop += "<option value='360012'>신안군</option>";
		addop += "<option value='360500'>여수시</option>";
		addop += "<option value='360014'>영광군</option>";
		addop += "<option value='360015'>영암군</option>";
		addop += "<option value='360016'>완도군</option>";
		addop += "<option value='360017'>장성군</option>";
		addop += "<option value='360018'>장흥군</option>";
		addop += "<option value='360019'>진도군</option>";
		addop += "<option value='360020'>함평군</option>";
		addop += "<option value='360021'>해남군</option>";
		addop += "<option value='360022'>화순군</option>";
		$('#sel2').append(addop);
		
	}
	
});
});