//...............................................Begin My StartUp......................................................................................
	    var request;  
		function sendInfo(){  
	    var email=document.myForm.email.value;  
		var url="Matchemail?email="+email;  
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
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo(){  
		if(request.readyState==4){  
		var val=request.responseText;  
		document.getElementById('mylocation').innerHTML=val;  
		}  
		} 

//...............................................ScaleUp My Business......................................................................................
		function sendInfo1(){  
	    var email=document.myForm.email.value;  
		var url="UpgradeBusinessMatchEmail?email="+email;  
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
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo(){  
		if(request.readyState==4){  
		var val=request.responseText;  
		document.getElementById('mylocation').innerHTML=val;  
		}  
		} 
//........................................................MENTOR ...........................................................................................		
		
		function sendInfo2(){  
	    var email=document.myForm.email.value;  
		var url="CheckemailAjax?email="+email;  
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
		}catch(e){alert("Unable to connect to server");}  
		}  
		function getInfo(){  
		if(request.readyState==4){  
		var val=request.responseText;  
		document.getElementById('mylocation').innerHTML=val;  
		}  
		} 
//...............................................SIG...........................................................................................................		
		
		
			function sendInfo3(){  
		    var email=document.sigForm.email.value;  
			var url="SigMatchEmail?email="+email;  
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
			}catch(e){alert("Unable to connect to server");}  
			}
			   
			function getInfo(){  
			if(request.readyState==4){  
			var val=request.responseText;  
			document.getElementById('myloca').innerHTML=val;  
			}  
			} 
		
//................................................Institute.......................................................................................................
			
		
			function sendInfo4(){  
		    var email=document.incubateeForm.email.value;  
			var url="IncubationMatchEmail?email="+email;  
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
			}catch(e){alert("Unable to connect to server");}  
			}  
			  
			function getInfo(){  
			if(request.readyState==4){  
			var val=request.responseText;  
			document.getElementById('myloc').innerHTML=val;  
			}  
			} 
//...................................................Incubation.....................................................................................................			
		
			
				function sendInfo5(){  
			    var email=document.instituteForm.pemail.value;  
				var url="InstituteMatchemailPage?email="+email;  
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
		