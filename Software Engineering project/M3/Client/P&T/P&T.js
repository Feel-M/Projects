const pay = () => {

    let type = document.getElementById('bills').value
    
    console.log(type)
        if (!type) {
            return
        }
        else if (type === 'Electricity') {
            document.getElementById('electricity').innerText = "Bill Amount: $0"
        } else if (type === 'Water') {
            document.getElementById('water').innerText = 'Bill Amount: $0'
        }else if (type === 'Gas') {
            document.getElementById('gas').innerText = 'Bill Amount: $0'
        }else if (type === 'All') {
            document.getElementById('water').innerText = 'Bill Amount: $0'
            document.getElementById('gas').innerText = 'Bill Amount: $0'
            document.getElementById('electricity').innerText = 'Bill Amount: $0'
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
            
            let a= document.getElementById('a').value
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
          alert("Please enter your Pin ")
          return
        } 
        let d = document.getElementById('d').value
        if (!d) {
            alert("Please Specify The Destination Account Number ")
            return
        } 
        let e = document.getElementById('e').value
        if (!e) {
          alert("Please Specify The Transfer Amount")
          return
        }
       
        else{
            document.getElementById("internalapplication").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
            alert("Transfer Proccessed!")
        }
        } 
        else if(type === 'domesticapplication')
        {
            let a2= document.getElementById('a2').value
        if (!a2) {
          alert("Please enter your fullname")
          return
        } 
        let b2 = document.getElementById('b2').value
         if   (!b2) {
          alert("Please enter your Account Number")
          return
        } 
        let c2= document.getElementById('c2').value
        if (!c2) {
          alert("Please enter your Pin ")
          return
        } 
        let d2 = document.getElementById('d2').value
        if (!d2) {
            alert("Please Specify The Destination Bank")
            return
        } 
        let e2 = document.getElementById('e2').value
        if (!e2) {
          alert("Please Specify The Destination Account Number")
          return
        }
        let f2 = document.getElementById('f2').value
        if (!f2) {
          alert("Please Specify The Transfer Amount")
          return
        }
       
    
        else{
            document.getElementById("domesticapplication").style.display = "none";
            let blur = document.getElementById("blur");
            blur.classList.toggle("active");
                alert("Transfer Proccessed!")
    
        }
    }
    else if(type === 'internationalapplication'){
           
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
        let c3= document.getElementById('c3').value
        if (!c3) {
          alert("Please enter your Account Pin ")
          return
        } 
        let d3 = document.getElementById('d3').value
        if (!d3) {
            alert("Please Specify The Destination Country")
            return
        } 
        let e3 = document.getElementById('e3').value
        if (!e3) {
          alert("Please Specify The Destination Bank ")
          return
        }
        let f3 = document.getElementById('f3').value
        if (!f3) {
          alert("Please Specify The Destination Bank Account")
          return
        }
        let g3 = document.getElementById('g3').value
        if (!g3) {
          alert("Please Specify The Transfer Amount")
          return
        }
        document.getElementById("internationalapplication").style.display = "none";
        let blur = document.getElementById("blur");
        blur.classList.toggle("active");
    alert("Transfer Proccessed!")
    
    }
    }