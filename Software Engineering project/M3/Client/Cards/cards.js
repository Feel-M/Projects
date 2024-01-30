
const activateapp = () => {

    document.getElementById("appform").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

 var deactivateapp = () => {

    document.getElementById("appform").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

 var activatereport = () => {

    document.getElementById("reportapp").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

 var deactivatereport = () => {

    document.getElementById("reportapp").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}
var activatepay = () => {

    document.getElementById("parpay").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

 var deactivatepay = () => {

    document.getElementById("parpay").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}
 var submit = (type) =>{

   
if (type === 'reportapp') {
    let a3= document.getElementById('a3').value
    if (!a3) {
      alert("Please enter your fullname")
      return
    } 
    let b3 = document.getElementById('b3').value
     if   (!b3) {
      alert("Please enter your Account Number")
      return
    } 
    let c3 = document.getElementById('c3').value
    if (!c3) {
      alert("Please enter your Card Number")
      return
    } 
    let d3 = document.getElementById('d3').value
    if (!d3) {
        alert("Please enter your Pin ")
        return
    } 
    let e3 = document.getElementById('e3').value
    if (!e3) {
      alert("Please enter Your Email")
      return
    }
    let f3 = document.getElementById('f3').value
    if (!f3) {
      alert("Please enter Your ID Number")
      return
    }
    else{
        document.getElementById("reportapp").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
        alert("Action Proccessed!")
    }
}
 else if(type === 'appform'){
    let a2= document.getElementById('a2').value
    if (!a2) {
      alert("Please enter your fullname")
      return
    } 
    let b2 = document.getElementById('b2').value
     if   (!b2) {
      alert("Please enter your Adress")
      return
    } 
    let c2 = document.getElementById('c2').value
    if (!c2) {
      alert("Please enter your Email ")
      return
    } 
    let d2 = document.getElementById('d2').value
    if (!d2) {
        alert("Please enter your Birth Date ")
        return
    } 
    let e2 = document.getElementById('e2').value
    if (!e2) {
      alert("Please enter Your ID Number")
      return
    }
    let f2 = document.getElementById('f2').value
    if (!f2) {
      alert("Please enter Your Phone Number")
      return
    }
    let g2 = document.getElementById('g2').value
    if (!g2) {
      alert("Please enter Your Account Number  ")
      return
    }
    else{
        document.getElementById("appform").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
        alert("Action Proccessed!")
}
}   
 if(type === 'parpay'){
      
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
      alert("Please enter your Card Number")
      return
    } 
    let d = document.getElementById('d').value
    if (!d) {
        alert("Please enter your Card Pin")
        return
    } 
    let e = document.getElementById('e').value
    if (!e) {
      alert("Please enter the desired amount")
      return
    }
    else{
        document.getElementById("parpay").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
        alert("Action Proccessed!");  
        }
       
}
}



const fullpay = () => document.getElementById('cash').innerText = "0"

 