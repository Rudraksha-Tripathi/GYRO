//    
//
//var fileinput = document.querySelector("#roomimgs");
//var form = document.forms;
//var filelist = [];
//
//fileinput.addEventListener('change',(e)=>{
//   filelist = [];
//    for(var i=0;i<fileinput.files.length;i++){
//        filelist.push(fileinput.files[i]);
//    }
//});
//
//form[0].addEventListener('submit',(e)=>{
//      e.preventDefault();
//        filelist.forEach((file)=>{
//        sendPics(file);
//    });
//});
//
//
////const saveImgs = async (request)=>{
////    const response = await fetch(request,{method:'post'});
////    alert(response.json())
////    const data = await response.json();
////    alert(data)
////    return data;
////};
//let request;
//const sendPics = (imgs)=>{
//    var formdata = new FormData();
//    formdata.set('file',imgs);
//    const url = "room_pic_upload.do";
////    saveImgs(url).then((data)=>{
////        if(data.resp==1){
////            alert('Images uploaded')
////            window.location = 'dashboard.jsp';
////        }else{
////            alert('Failed to upload')
////            
////        }
////    })
////    .catch((err)=>{
////        console.log(err);
////        alert('error aala')
////    });
//    
//     request = new XMLHttpRequest();
//    request.open("POST",url);
//    request.onreadystatechange = imgstatus;
//    request.send(formdata);
//};
//
//const imgstatus = ()=>{
//    if(request.status==200 && request.readyState==4){
//        alert(request.responseText);
//    }else{
//        alert('Failed to upload')
//    }
//}
//
//
//
// 
//  if (window.File && window.FileList && window.FileReader){
//    var filesInput = document.getElementById("roomimgs");
//    filesInput.addEventListener("change", function(event) {
//        
//      var files = event.target.files; //FileList object
//      var output = document.querySelector(".output_imgs");
//        var piccontainer = document.getElementById("pic_container");
//        piccontainer.style.display = 'block';
//      
////        var top = left = 20;
//      for (var i = 0; i < files.length; i++){
//        var file = files[i];
//        //Only pics
//        if (!file.type.match('image'))
//          continue;
//        var picReader = new FileReader();
//        picReader.addEventListener("load", function(event) {
//          var picFile = event.target; 
//          var dv = document.createElement("div");
//            dv.className = 'recs';
////            dv.style.top = top+'px';
////				dv.style.left = left+'px';				
////				left = left + 200;
//				if((i+1)%4==0){
//					
//				}
//            var imgdiv = document.createElement("div");
//            imgdiv.className = 'imgrecs';
//          imgdiv.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
//            "title='" + picFile.name + "'/>";
//            dv.appendChild(imgdiv);
//            piccontainer.appendChild(dv);
//          output.insertBefore(piccontainer, null);
//        });
//        //Read the image
//        picReader.readAsDataURL(file);
//      }
//    });
//  }else{
//    console.log("Your browser does not support File API");
//  }
//            
//       
//
//
//    
//
