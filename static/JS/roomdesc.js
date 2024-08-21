 document.onload = load();
		function load(){
			loadPayMode();
			loadServices();
			loadPics();
			}
		function loadPics(){
			var req = new XMLHttpRequest();
			var url = "getpicpath.do";
			req.open("GET",url,true);
			req.onreadystatechange = function(){
				if(req.readyState==4&&req.status==200){
					//alert(req.responseText);
				}
			};
			req.send();
			
			//alert('ye pic ka kaam aap hi karo      :) ')
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

//      Images Slides       //

	var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  
}