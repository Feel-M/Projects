var showlogon = () => {
  document.getElementById("logon").style.display = "block";
  let blur = document.getElementById("blur");
  blur.classList.toggle("active");
};

var hidelogon = () => {
  document.getElementById("logon").style.display = "none";
  let blur = document.getElementById("blur");
  blur.classList.toggle("active");
  document.getElementById("loginerror").innerText = " ";
};

var login = () => {
  let username = document.getElementById("username").value;

  let password = document.getElementById("password").value;

  if (username === "client" && password === "client") {
    window.location.href = "../Client/index.html";
  
  } else if (username === "banker" && password === "banker") {
    window.location.href = "../Banker/index.html";
  } else if (username === "admin" && password === "admin") {
    window.location.href = "../Admin/index.html";
  } else {
    document.getElementById("loginerror").innerText = "Invalid Credentials!";
  }
};
