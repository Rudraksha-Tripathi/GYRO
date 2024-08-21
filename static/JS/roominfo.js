getAllElement(){
	roomForm = document.getElementById("roomform");
	picForm = document.getElementById("pic");

}

setAllActions(){
	console.log('hello');
	roomForm.addEventListener('submit', e => {
		e.preventDefault();
	}
	picForm.addEventListener('submit', e => {
		e.preventDefault();
	}
}

