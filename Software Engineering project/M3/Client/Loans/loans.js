var activateapplication = () => {

    document.getElementById("loanapplication").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

var deactivateapplication = () => {

    document.getElementById("loanapplication").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}


var activatepayment = () => {

    document.getElementById("loanpaymentapp").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

var deactivatepayment = () => {

    document.getElementById("loanpaymentapp").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
    

}


var submit = (type) =>{

   
    if (type === 'loanpaymentapp') {
        
        let a2= document.getElementById('a2').value
        if (!a2) {
          alert("Please enter your fullname")
          return
        } 
        let b2 = document.getElementById('b2').value
         if   (!b2) {
          alert("Please enter your Id Number")
          return
        } 
        let c2 = document.getElementById('c2').value
        if (!c2) {
          alert("Please enter Your Account Number")
          return
        } 
        let d2 = document.getElementById('d2').value
        if (!d2) {
            alert("Please enter your Loan Number")
            return
        } 
        let e2 = document.getElementById('e2').value
        if (!e2) {
          alert("Please enter your Routing Number")
          return
        }
        else{
        document.getElementById("loanpaymentapp").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
            alert("Action Proccessed!")     
    } 
}
    else if(type === 'loanapplication')
    {
        let a= document.getElementById('a').value
        if (!a) {
          alert("Please enter your fullname")
          return
        } 
        let b = document.getElementById('b').value
         if   (!b) {
          alert("Please enter your Address")
          return
        } 
        let c = document.getElementById('c').value
        if (!c) {
          alert("Please enter Your Email")
          return
        } 
        let d = document.getElementById('d').value
        if (!d) {
            alert("Please enter your Date of Birth ")
            return
        } 
        let e = document.getElementById('e').value
        if (!e) {
          alert("Please enter your ID Number")
          return
        }
        let f = document.getElementById('f').value
        if (!f) {
          alert("Please enter Your Phone Number")
          return
        }
        else{
        document.getElementById("loanapplication").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
            alert("Action Proccessed!")
    }
}
}