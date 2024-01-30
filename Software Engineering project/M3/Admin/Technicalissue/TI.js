 const submit = () => {
    let name = document.getElementById('clientid').value
    console.log(name)
  if (!name) { 
    alert('Please enter a client ID')
    return
  }     
    else if (name == '123456') {
      document.getElementById('1').innerText = "ISSUE RESOLVED"
    }
    else if (name == '101110') {
        document.getElementById('2').innerText = "ISSUE RESOLVED"
      }
      else if (name == '00009') {
        document.getElementById('3').innerText = "ISSUE RESOLVED"
      }
}
// let msg = document.getElementById('messaage').value
// if (!msg) { 
// alert('Please Write A Resolve Message To The Client')
// return
// }     