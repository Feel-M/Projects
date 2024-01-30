function showPopup() {
    document.getElementById("overlay").style.display = "block";
    document.getElementById("overlay1").style.display = "block";
    document.getElementById("overlay2").style.display = "block";

    document.getElementById("popup").style.display = "block";
}

function closePopup() {
    document.getElementById("overlay").style.display = "none";
    document.getElementById("overlay1").style.display = "none";
    document.getElementById("overlay2").style.display = "none";
    document.getElementById("popup").style.display = "none";
}

function logout() {
    // Code to execute when the user confirms the logout action
    console.log("Logged out successfully");
    // Redirect to another page
    window.location.href = "../Landing/landing.html";
}