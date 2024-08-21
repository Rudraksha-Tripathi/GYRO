

const find = document.querySelector("#find");
const bm = document.querySelector("#bm");
const map = document.querySelector("#map");
const all_locs = document.querySelector(".All-locations");
const bookmarks = document.querySelector(".bookmarks");
const gmap = document.querySelector(".gmap");
const ttl = document.querySelector('.title');
const mapshow = document.querySelector("#googleMap");



var cols = document.querySelectorAll(".col");
var stars = document.querySelectorAll(".fa-star");
alert(stars)



find.addEventListener('click',(e)=>{
    e.preventDefault();
    find.style.left = '20px';
    bm.style.left = '-5px';
    map.style.left = '-5px';
    all_locs.style.display = 'block';
    bookmarks.style.display = 'none';
    gmap.style.display = 'none';
    ttl.innerHTML = 'Find By Locations';
 
});

bm.addEventListener('click',(e)=>{
    e.preventDefault();
    find.style.left = '-5px';
    bm.style.left = '20px';
    map.style.left = '-5px';
    all_locs.style.display = 'none';
    bookmarks.style.display = 'block';
    gmap.style.display = 'none';
    ttl.innerHTML = 'Saved by You'
    
});



map.addEventListener('click',(e)=>{
    e.preventDefault();
    find.style.left = '-5px';
    bm.style.left = '-5px';
    map.style.left = '20px';
     all_locs.style.display = 'none';
    bookmarks.style.display = 'none';
    gmap.style.display = 'block';
    ttl.innerHTML = 'Find on Map';
    getLocation();
    
});


const loadstar = ()=>{
    var i;
    for(i=0;i<cols.length;i++){
        let span = document.createElement('span');
        span.className = 'fa fa-star';
        cols[i].appendChild(span);
    }
};

const bookmark = ()=>{
    
    for(const star in stars){
        star.addEventListener('click',(e)=>{
            star.style.color = 'goldrod';
        })
    }
    
};


// Function Actions

 loadstar();
 bookmark();


// Search Record

const searchRecord = ()=>{
    let filter = document.getElementById('srch').value.toUpperCase();
    let datas = document.getElementsByClassName('loc');

    let rows = document.getElementsByClassName('row')

    let cols = document.getElementsByClassName('col')
     console.log(cols)

for(var j=0;j<rows.length;j++){        
    for(var i=0;i<cols.length;i++){
        let rec = cols[j][i];
        let loc = cols[i].getElementsByClassName('loc')[0];    
        let txtvalue = loc.textContent;
        if(txtvalue.toUpperCase().indexOf(filter) > -1){
                cols[i].style.display = "";
        }else{
            cols[i].style.display = "none";
        }
    }
}
};

            
//          Google Map

//const showMap (latlng) =>{
//  let mapOptions = {
//    center: latlng,
//    zoom: 17
//  };
//  Gmap = new google.maps.Map(mapshow,mapOptions);
//}
     function showLocation(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var latlongvalue = position.coords.latitude + ","
            + position.coords.longitude;
            var img_url = "https://maps.googleapis.com/maps/api/staticmap?center="+latlongvalue+"&amp;zoom=14&amp;size=400x300&amp;key=AIzaSyCzHFmfWEEMWHLp9zyZ10fiytHm5nFczEA";
            mapshow.innerHTML = 
            "<img src='"+img_url+"'>";
         }
         function errorHandler(err) {
            if(err.code == 1) {
               alert("Error: Access is denied!");
            } else if( err.code == 2) {
               alert("Error: Position is unavailable!");
            }
         }
         function getLocation(){
            if(navigator.geolocation){
               // timeout at 60000 milliseconds (60 seconds)
               var options = {timeout:60000};
               navigator.geolocation.getCurrentPosition
               (showLocation, errorHandler, options);
            } else{
               alert("Sorry, browser does not support geolocation!");
            }
         }

    










