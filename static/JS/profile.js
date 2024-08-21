const edit = document.getElementById('editinfo')
const save = document.getElementById('saveinfo')
const inputs = document.querySelectorAll('.form-control')
const updp = document.getElementById('updp')
const dpbtn = document.querySelector('.dpbtn')

//alert(inputs.length)

edit.addEventListener('click',()=>{
    for(var i=0;i<inputs.length;i++){
//        inputs[i].value = '';
        inputs[i].disabled = false;
    }
    save.disabled = false;
    
});

save.addEventListener('click',()=>{
    
})


dpbtn.addEventListener('click',()=>{
    updp.style.display = 'block';
})
