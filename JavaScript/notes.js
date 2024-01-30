function test(val){
    let result = "  "

let lookup = {
"FL": "florida",
"NY": "new york",
"AZ": "arizona"

};

result = lookup[val];
return result;
}



let array = []
array
array.unshift(1)
array
array.unshift(2)
array
array.pop()
array
array.push(3)

array
//closure (function in a function)
function outer(){
let text = 'hey'
    function inner(){
        text += ' you'
     return   text
    }
    return inner()
}
let result = outer()
console.log(result)


//function expression (storing a function inside a variable)
const printName = function(num){return 'Feel '.repeat(num)}
let name = printName(3)
console.log(name)


//Arrow function 

const pure = (num) => 'Feel'.repeat(num)
//another type (if brackets are included 'return' must be written)
const pure2 = (num) => {
    return 'Feel'.repeat(num)
}


// array functions (map,reduce,filter)

let words = ['accent','word','long','javascript', 'lead']
let numbers = [1,2,3,4,5,6,7,13,43,12,15,10]

//map
const timesTwo = numbers.map(num => num * 2)
timesTwo

//filter
const containsO = words.filter(word => word.includes('o'))
containsO
const LengthOfFour = words.filter(word => word.length === 4)
LengthOfFour

//reduce
const reduced = numbers.reduce((acc,cuu) => acc + cuu)
reduced




//printing methods (String Interpolation)2222222

let myname= 'mostafa'
let myage = 21
let sentence = `my name is ${myname} and i am ${myage}`
console.log(sentence)