const message = () => 
{
let name = document.getElementById('name').value
let mail = document.getElementById('mail').value
let PN = document.getElementById('pn').value
// let message = document.getElementById('message').value
if (!name) { 
    alert("You have to fill all the fields")
    

}
else if(!mail){
    alert("You have to fill all the fields")
    
}
else if(!PN){
    alert("You have to fill all the fields")
    return
}
// else if(!message.value===message...){
//     alert("You have to fill all the fields")
//     return
// }
else{
    alert("Message Sent!")}

}