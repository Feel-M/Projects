const AcceptBR = () => {
    let client0 = document.getElementById('close').value
  
    if (!client0) {
        alert ("You have to choose a Loan request")
      return
    }     
      else if (client0 == '255212455, Ramy') {
        document.getElementById('AAr').innerText = 'Client "ramy" with ID "255212455" close account request is accepted' 
      }
      // else if(client0 == "225563258, Ali"){
      //   document.getElementById('AAr').innerText = 'Client "Ali" with ID "225563258" close account request is accepted' 
      // }
  }
  
  const RejectBR = () => {
    let client1 = document.getElementById('close').value
  
    if (!client1) {
        alert ("You have to choose a Loan request")
      return
    }     
      else if (client1 == '122252522, hamada') {
        document.getElementById('RAr').innerText = 'Client "hamada" with ID "122252522" close account request is Rejected' 
      }
      // else if(client1 == "115852522, Mariam"){
      //   document.getElementById('RAr').innerText = 'Client "Mariam" with ID "115852522" close account request is Rejected' 
      // }
  
   
  }
  
  const AcceptBL = () => {
    let client2 = document.getElementById('open').value
  
    if (!client2) {
        alert ("You have to choose a Loan request")
      return
    }     
      else if (client2 == '125882522, Clara') {
        document.getElementById('AAl').innerText = 'Client "Clara" with ID "125882522" Loan request is accepted' 
      }
      // else if(client2 == "611213258, Nour"){
      //   document.getElementById('AAl').innerText = 'Client "Nour" with ID "611213258" open account request is accepted' 
      // }
    }
  
    const RejectBL = () => {
      let client3 = document.getElementById('open').value
    if (!client3) {
        alert ("You have to choose a Loan request")
      return
    }     
      else if (client3 == '252132455, Nada') {
        document.getElementById('RAl').innerText = 'Client "Nada" with ID "252132455" Loan request is Rejected' 
      }
      // else if(client3 == "116569525, Youssef"){
      //   document.getElementById('RAl').innerText = 'Client "Youssef" with ID "116569525" open account request is Rejected' 
      // }
      // else if(client3 == "111155852, Mustafa"){
      //   document.getElementById('RAl').innerText = 'Client "Mustafa" with ID "111155852" open account request is Rejected' 
      // }
    }  
             
    const ViewRight = () =>{
      let client4 = document.getElementById('close').value
  
      if (!client4) {
        alert ("You have to choose a Loan request")
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
  
    const ViewLeft = () =>{
      let client5 = document.getElementById('open').value
  
      if (!client5) {
        alert ("You have to choose a Loan request")
        return
      }     
      else if (client5 == '125882522, Clara') {
        document.getElementById("openaccount").style.display = "block";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
  
      }
      else if  (client5 = '252132455, Nada'){
        
        document.getElementById("openaccount2").style.display = "block";
        let blur2 = document.getElementById("blur");
        blur2.classList.toggle("active");
  
      }
  
    }
      
          
  
      // var activateopen = () => {
      
      //     document.getElementById("openaccount").style.display = "block";
      //     let blur = document.getElementById("blur");
      //     blur.classList.toggle3
          
      //     ("active");
      // }
      
      // var deactivateopen = () => {
      
      //     document.getElementById("openaccount").style.display = "none";
      //     let blur = document.getElementById("blur");
      //     blur.classList.toggle("active");
      // }
      
      // var activateclose = () => {
      
      //     document.getElementById("closeaccount").style.display = "block";
      //     let blur = document.getElementById("blur");
      //     blur.classList.toggle("active");
      // }
      
      // var deactivateclose = () => {
      
      //     document.getElementById("closeaccount").style.display = "none";
      //     let blur = document.getElementById("blur");
      //     blur.classList.toggle("active");
      // }
      
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