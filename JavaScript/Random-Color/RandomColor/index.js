let chars = [0,1,2,3,4,5,6,7,8,9,'A','B','C','D','F']

const SetColors = () => {
    
let color = new Array(6).fill("").map(() => chars[Math.floor(Math.random() * chars.length)]).join("")
let newcolor = "#" + color
let doc = document.getElementById("body")
doc.style.background = newcolor
document.getElementById('label').innerHTML
                = newcolor;
}

