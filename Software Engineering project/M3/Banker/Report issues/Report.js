    
const submit = () => {

    let fullname = document.getElementById('fullName').value
    let mail = document.getElementById('mail').value
    let PN = document.getElementById('PN').value
    // let message = document.getElementById('message').value
    if (!fullname) { 
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
    else{alert("Transfer Proccessed!")}
  
    
}
 
