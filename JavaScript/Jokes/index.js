async function GetJoke(){
    let label = document.getElementById('joke')
    const url = 'https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single';
   let jokeData =  await fetch(url,{
    headers:{
        'accept': 'application/json'
    }
   });
  let jokeObj = await jokeData.json() ;
   console.log(jokeObj)
label.innerText = jokeObj.joke
   // label.innerHTML = joke
}

