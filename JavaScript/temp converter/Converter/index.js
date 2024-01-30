let celsius = document.getElementById('celsius')
let fahrenheit = document.getElementById('fahrenheit')

let celToFar = () => {
   let output = (parseFloat(celsius.value) * 9/5) + 32
    fahrenheit.value = parseFloat(output.toFixed(2)) 
}

let FarToCel = () => {

let output = (fahrenheit.value - 32) * 5/9
celsius.value = parseFloat(output.toFixed(2))
}