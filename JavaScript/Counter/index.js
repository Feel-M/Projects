function FirstDecrease(){
if(document.getElementById("firstlabel").innerHTML == 0){
    return
}
else
document.getElementById("firstlabel").innerHTML-- 
}

function FirstReset(){

    document.getElementById("firstlabel").innerHTML = 0
}

function FirstIncrease(){

    document.getElementById("firstlabel").innerHTML++
}

function SecondDecrease(){
    if(document.getElementById("secondlabel").innerHTML == 0){
        return
    }
    else
    document.getElementById("secondlabel").innerHTML-- 
    
}
function SecondReset(){

    document.getElementById("secondlabel").innerHTML = 0
}
function SecondIncrease(){
    document.getElementById("secondlabel").innerHTML++
    
}