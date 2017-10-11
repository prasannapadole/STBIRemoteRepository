
	    var request;  
		function sendInfoo(){  
	    var email=document.instituteForm.pemail.value;  
		var url="InstituteMatchemail?email="+email;  
		if(window.XMLHttpRequest){  
		request=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
		request=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
		request.onreadystatechange=getInfo;  
		request.open("POST",url,true);  
		request.send();  
		}catch(e){alert("Unable to connect server");}  
		}  
		  
		function getInfo(){  
		if(request.readyState==4){  
		var val=request.responseText;  
		document.getElementById('mylocc').innerHTML=val;  
		}  
		} 
		