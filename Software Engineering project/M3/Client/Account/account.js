var redeem = () => {

    document.getElementById("points").innerText = "0 pts"
    document.getElementById("cash").innerText = "7,730"
    
    } 
    
     var activateopen = () => {
    
        document.getElementById("openaccount").style.display = "block";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
    }
    
     var deactivateopen = () => {
    
        document.getElementById("openaccount").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
    }
    
    var activateclose = () => {
    
        document.getElementById("closeaccount").style.display = "block";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
    }
    
     var deactivateclose = () => {
    
        document.getElementById("closeaccount").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
    }
    
     var submit = (type) =>{
    if (type === 'closeaccount') {
    
        let a = document.getElementById('a').value
        if (!a) {
          alert("Please enter your fullname")
          return
        } 
        let b = document.getElementById('b').value
         if   (!b) {
          alert("Please enter your Account Number")
          return
        } 
        let c = document.getElementById('c').value
        if (!c) {
          alert("Please enter your Pin")
          return
        } 
        let d = document.getElementById('d').value
        if (!d) {
          alert("Please enter your Email")
          return
        } 
        let e = document.getElementById('e').value
        if (!e) {
          alert("Please enter your ID Number")
          return
        }
        else{ 
            document.getElementById("closeaccount").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
            alert("Action Proccessed!")
        }
        
    } else if(type === 'openaccount'){
    
    let a2 = document.getElementById('a2').value
    if (!a2) {
      alert("Please enter your fullname")
      return
    } 
    let b2 = document.getElementById('b2').value
    if (!b2) {
      alert("Please enter your Address")
      return
    } 
    let c2 = document.getElementById('c2').value
    if (!c2) {
      alert("Please enter your Email")
      return
    } 
    let d2 = document.getElementById('d2').value
    if (!d2) {
      alert("Please enter a date")
      return
    } 
    let e2 = document.getElementById('e2').value
    if (!e2) {
      alert("Please enter your ID Number")
      return
    } 
    let f = document.getElementById('f').value
    if (!f) {
      alert("Please enter your Phone Number")
      return
    } 
    let g = document.getElementById('g').value
    if (!g) {
      alert("Please enter your Nationality")
      return
    }
    else{
        document.getElementById("openaccount").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
            alert("Action Proccessed!")
    } 
    }
    }
    
     const fullcard = () => {
        document.getElementById("cash").innerText = "10,000"
    }
    
     const partialcard = (paidamount) => {
    let curramount = document.getElementById("cash").innerText
    
        document.getElementById("cash").innerText = Number(curramount) + Number(paidamount)
    }
    
    