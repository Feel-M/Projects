
const GetColors = () => {
let chars = [0,1,2,3,4,5,6,7,8,9,'A','B','C','D','F']

let color = new Array(6).fill("").map(() => chars[Math.floor(Math.random() * chars.length)]).join("")
let newcolor = "#" + color

                return newcolor;
}
let realColor = GetColors()

const app = () => {

   
    let  colorBox = document.getElementById("colorbox")
    colorBox.style.background = realColor
answers = [realColor,GetColors(),GetColors()]
let first = document.getElementById("first")
let second = document.getElementById("second")
let third = document.getElementById("third")

first.innerText = answers[Math.floor(Math.random() * answers.length)]
answers = answers.filter( e => e != first.innerHTML)

second.innerText = answers[Math.floor(Math.random() * answers.length)]
answers = answers.filter(e => e !== second.innerHTML)

third.innerText = answers[Math.floor(Math.random() * answers.length)]
answers = answers.filter(e => e !== third.innerHTML)






}



const Check = (id) => {
    let buttonid = document.getElementById(id)
    console.log(buttonid)
    if (buttonid.innerHTML == realColor){
        location.reload()
    }
    else (document.getElementById("label").innerHTML = "WRONG!")

  
}  

