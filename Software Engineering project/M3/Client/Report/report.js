const message = () => {


    let a= document.getElementById('a').value
    if (!a) {
      alert("Please enter your fullname")
      return
    } 
    let b = document.getElementById('b').value
     if   (!b) {
      alert("Please enter your Email")
      return
    } 
    let c= document.getElementById('c').value
    if (!c) {
      alert("Please enter your Phone Number ")
      return
    } 
    else{
        alert("Message Sent!")
    }

}