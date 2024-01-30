
const viewpayments = () => {
    let name1 = document.getElementById('name').value
console.log(name1)
if (!name1) { 
return
}     
else if (name1=== '123456') {
  document.getElementById('electricity').innerText = "Bill Amount: $130.99"
  document.getElementById('gas').innerText = "Bill Amount: $59.99"
  document.getElementById('water').innerText = "Bill Amount: $100"
}
}
const viewtransactions = () => {
let name2 = document.getElementById('name').value
console.log(name2)
if (!name2) { 
return
}     
else if (name2=== '123456') {
document.getElementById("tr1").style.display = "block";
document.getElementById("li1").style.display = "block";
document.getElementById("li2").style.display = "block";
}
}




const activateinternal = () => {

    document.getElementById("internalapplication").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

const deactivateinternal = () => {

    document.getElementById("internalapplication").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

const activatedomestic = () => {

    document.getElementById("domesticapplication").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

const deactivatedomestic = () => {

    document.getElementById("domesticapplication").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}


const activateinternational = () => {

    document.getElementById("internationalapplication").style.display = "block";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}

const deactivateinternational = () => {

    document.getElementById("internationalapplication").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
}


var submit = (type) =>{

   
    if (type === 'internalapplication') {
        
        document.getElementById("internalapplication").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
        
        alert("Transfer Proccessed!")

    } else if(type === 'domesticapplication'){
       
        document.getElementById("domesticapplication").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
            alert("Transfer Proccessed!")

    }else if(type === 'internationalapplication'){
       
      document.getElementById("internationalapplication").style.display = "none";
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
alert("Transfer Proccessed!")

}}
