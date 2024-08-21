
document.onload = load();
		function load(){
			loadPayMode();
			loadServices();
			}
		
		function loadServices(){
			var req = new XMLHttpRequest();
			var i = document.getElementById("srv");
			var url = "service.do?serviceid="+i.value;
			req.open("GET",url,true);
			req.onreadystatechange = function(){
				if(req.readyState==4&&req.status==200){
					const services =  req.responseText.split(" ");
                    //alert(services)
                    const s_available = document.querySelector('.services-av');
                    for(var i=0;i<services.length;i++){
                        let li = document.createElement('li');
                        if(i==0){
                        li.className = 'list-group-item list-group-item-danger';
                        }else if(i==1){li.className = 'list-group-item list-group-item-success';}
                        else if(i==2){li.className = 'list-group-item list-group-item-info';}
                        else{li.className = 'list-group-item list-group-item-secondary';}
                        li.innerHTML = services[i];
                        s_available.appendChild(li);
                    }
                    
				}
			};
			req.send();
		}
    
		function loadPayMode(){
			var req = new XMLHttpRequest();
			var i = document.getElementById("pym");
			var url = "pymode.do?pymodeid="+i.value;
			req.open("GET",url,true);
			req.onreadystatechange = function(){
				if(req.readyState==4&&req.status==200){
					const paymodes =  req.responseText.split(" ");
                    //alert(paymodes)
                    const pymodes = document.querySelector('.pymodes');
                      for(var i=0;i<paymodes.length;i++){
                        let li = document.createElement('li');
                        li.className = 'list-group-item list-group-item-action';
                        li.innerHTML = paymodes[i];
                        pymodes.appendChild(li);
				}
                }
			};
			req.send();
		}

    const chservice = document.querySelector('.change-sbtn');
    const servicelist = document.querySelector('.services-av');
    const servicetable = document.querySelector('.change-services');
    const chpymodes = document.querySelector('.change-pbtn')
    const paymodelist = document.querySelector('.pymodes');
    const paymodetable = document.querySelector('.change-paymodes');
 


    chservice.addEventListener('click',()=>{
        servicelist.style.display = 'none';
        servicetable.style.display = 'block';     
        chservice.style.display = 'none';
    })

    const changePayModeList = ()=>{
        paymodelist.style.display = 'none';
        paymodetable.style.display = 'block';     
        chpymodes.style.display = 'none';
    }