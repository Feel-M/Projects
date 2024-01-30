
    const viewpayments = () => {
        let name1 = document.getElementById('name').value
    console.log(name1)
  if (!name1) { 
    alert ("You have to enter an Account number")
    return
  }     
    else if (name1=== '123456') {
      document.getElementById('electricity').innerText = "Bill Amount: $130.99"
      document.getElementById('gas').innerText = "Bill Amount: $59.99"
      document.getElementById('water').innerText = "Bill Amount: $100"
    }
    else{
        alert ("This account number does not exist")

    }
}
const viewtransactions = () => {
    let name2 = document.getElementById('name').value
    console.log(name2)
if (!name2) { 
    alert ("You have to enter an Account number")
return
}     
else if (name2=== '123456') {
    document.getElementById("tr1").style.display = "block";
    document.getElementById("li1").style.display = "block";
    document.getElementById("li2").style.display = "block";
}
else{
    alert ("This account number does not exist")

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
            let fullName = document.getElementById('fullName').value
            let accno = document.getElementById('accno').value
            let pin = document.getElementById('pin').value
            let Dacc = document.getElementById('Dacc').value
            let TA = document.getElementById('TA').value
            if (!fullName) { 
                alert("You have to fill all the fields")
                document.getElementById("internalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
                
                
            
            }
            else if(!accno){
                alert("You have to fill all the fields")
                document.getElementById("internalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
                
            }
            else if(!pin){
                alert("You have to fill all the fields")
                document.getElementById("internalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }
            else if(!Dacc){
                alert("You have to fill all the fields")
                document.getElementById("internalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }
            else if(!TA){
                alert("You have to fill all the fields")
                document.getElementById("internalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }

            else
            {
                
                alert("Transfer Proccessed!")
            }
            
    
        } else if(type === 'domesticapplication'){
           
            document.getElementById("domesticapplication").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
            let fullName = document.getElementById('fullName').value
            let accno = document.getElementById('accno').value
            let pin = document.getElementById('pin').value
            let Dacc = document.getElementById('Dacc').value
            let DB = document.getElementById('DB').value
            let TA = document.getElementById('TA').value

            if (!fullName) { 
                alert("You have to fill all the fields")
                document.getElementById("domesticapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            
            }
            else if(!accno){
                alert("You have to fill all the fields")
                document.getElementById("domesticapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }
            else if(!pin){
                alert("You have to fill all the fields")
                document.getElementById("domesticapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }
            else if(!Dacc){
                alert("You have to fill all the fields")
                document.getElementById("domesticapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }
            else if(!DB){
                alert("You have to fill all the fields")
                document.getElementById("domesticapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }
            else if(!TA){
                alert("You have to fill all the fields")
                document.getElementById("domesticapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
            }

            else
            {
                alert("Transfer Proccessed!")
            }

                
    
        }else if(type === 'internationalapplication'){
           
          document.getElementById("internationalapplication").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
        let fullName = document.getElementById('fullName').value
        let accno = document.getElementById('accno').value
        let pin = document.getElementById('pin').value
        let DC = document.getElementById('DC').value
        let DB = document.getElementById('DB').value
        let Dacc = document.getElementById('Dacc').value
        let TA = document.getElementById('TA').value

        if (!fullName) { 
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        
        }
        else if(!accno){
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        }
        else if(!pin){
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        }
        else if(!DC){
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        }
        else if(!DB){
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        }
        else if(!Dacc){
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        }
        else if(!TA){
            alert("You have to fill all the fields")
            document.getElementById("internationalapplication").style.display = "block";
                let blur = document.getElementById("blur");
                blur.classList.toggle("active");
                
        }

        else
        {
            alert("Transfer Proccessed!")
        }
    
    }
}