
const conuser_view = document.querySelector("#con_user");
const newrq_view = document.querySelector("#new_rq");
const chats_view = document.querySelector("#chats");
const title = document.querySelector(".connect-title");

const connected = document.querySelector(".connected");
const newreq = document.querySelector(".newreq");
const chat = document.querySelector(".chat");
const chat_window = document.querySelector(".chat-window");
const chatnow = document.querySelector('.chatnow')


conuser_view.addEventListener('click',(e)=>{
    e.preventDefault();
    connected.style.display = 'block';
    newreq.style.display = 'none';
    chat.style.display = 'none';
    chat_window.style.display = 'none';
    title.innerHTML = "All Connected Users";
    
    
});

newrq_view.addEventListener('click',(e)=>{
    e.preventDefault();
    newreq.style.display = 'block';
    connected.style.display = 'none';
    chat.style.display = 'none';
    chat_window.style.display = 'none';
    title.innerHTML = "New Requests";
    
});

chats_view.addEventListener('click',(e)=>{
    e.preventDefault();
    chat.style.display = 'block';
    title.innerHTML = "Chats";
    chat_window.style.display = 'none';
    
});

chatnow.addEventListener('click',(e)=>{
    e.preventDefault();
    newreq.style.display = 'none';
    connected.style.display = 'none';
    chat.style.display = 'none';
    chat_window.style.display = 'block';
    title.innerHTML = "Chat";
    
    
});