const AcceptBR = () => {
  let client0 = document.getElementById('close').value

  if (!client0) {
    alert("You must choose an employee to close account")
    return
  }     
    else if (client0 == '255212455, Ramy') {
      // document.getElementById('AAr').innerText = 'Client "ramy" with ID "255212455" close account request is accepted'
      alert("Account Closed!")
    }
    else if (client0 == '122252522, hamada') {
          //  document.getElementById('AAr').innerText = 'Client "hamada" with ID "122252522" close account request is Rejected' 
           alert("Account Closed!")

       }


    // else if(client0 == "225563258, Ali"){
    //   document.getElementById('AAr').innerText = 'Client "Ali" with ID "225563258" close account request is accepted' 
    // }
}

// const RejectBR = () => {
//   let client1 = document.getElementById('close').value

//   if (!client1) {
//     return
//   }     
//     else if (client1 == '122252522, hamada') {
//       document.getElementById('RAr').innerText = 'Client "hamada" with ID "122252522" close account request is Rejected' 
//     }
//     // else if(client1 == "115852522, Mariam"){
//     //   document.getElementById('RAr').innerText = 'Client "Mariam" with ID "115852522" close account request is Rejected' 
//     // }

  
// }

const openacc = () => {
let a = document.getElementById('a').value
if (!a) {
  alert("there is a missing requirement")
  return
} 
let b = document.getElementById('b').value
if (!b) {
  alert("there is a missing requirement")
  return
} 
let c = document.getElementById('c').value
if (!c) {
  alert("there is a missing requirement")
  return
} 
let d = document.getElementById('d').value
if (!d) {
  alert("there is a missing requirement")
  return
} 
let e = document.getElementById('e').value
if (!e) {
  alert("there is a missing requirement")
  return
} 
let f = document.getElementById('f').value
if (!f) {
  alert("there is a missing requirement")
  return
} 
let client2 = document.getElementById('name22').value
  if (!client2) {
    alert("The Employee Fullname Is Incorrect")
    return
  }     
    else if (client2 ==  'clara zakaria khalaf') {
      // document.getElementById('name22').innerText = 'Account For Banker Clara Created!'
      alert("Account For Clara is Created!")
    }
    else if (client2 == 'Nada nasr mohamed') {
      // document.getElementById('AAL2').innerText = 'Account For Banker Nada Is Created' 
      alert("Account For nada Created!")
    }
    // else if(client2 == "611213258, Nour"){
    //   document.getElementById('AAl').innerText = 'Client "Nour" with ID "611213258" open account request is accepted' 
    // }
  }

  // const RejectBL = () => {
  //   let client3 = document.getElementById('open').value
  // if (!client3) {
  //   return
  // }     
  //   else if (client3 == '252132455, Nada') {
  //     document.getElementById('RAl').innerText = 'Client "Nada" with ID "252132455" open account request is Rejected' 
  //   }
    // else if(client3 == "116569525, Youssef"){
    //   document.getElementById('RAl').innerText = 'Client "Youssef" with ID "116569525" open account request is Rejected' 
    // }
    // else if(client3 == "111155852, Mustafa"){
    //   document.getElementById('RAl').innerText = 'Client "Mustafa" with ID "111155852" open account request is Rejected' 
    // }
  
           
  const ViewRight = () =>{
    let client4 = document.getElementById('close').value

    if (!client4) {
      return
    }     
    else if (client4 == '255212455, Ramy') {
      document.getElementById("closeaccount").style.display = "block";
      let blur = document.getElementById("blur");
      blur.classList.toggle("active");

    }
    else if  (client4 = '122252522, hamada'){
      document.getElementById("closeaccount2").style.display = "block";
      let blur2 = document.getElementById("blur");
      blur2.classList.toggle("active");

    }
  }


    
    var submit = (type) =>{
    if (type === 'closeaccount') {
            document.getElementById("closeaccount").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
            // alert("Action Proccessed!")    
    } 
    if (type === 'closeaccount2') {
      document.getElementById("closeaccount2").style.display = "none";
      let blur = document.getElementById("blur");
      blur.classList.toggle("active");
      // alert("Action Proccessed!") 
} 
    else if(type === 'openaccount'){
            document.getElementById("openaccount").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
            // alert("Action Proccessed!")
    }
    else if(type === 'openaccount2'){
       
      document.getElementById("openaccount2").style.display = "none";
      let blur = document.getElementById("blur");
      blur.classList.toggle("active");
      // alert("Action Proccessed!")
}
    
    }


            
        
      
      
        
        
         
    
      
