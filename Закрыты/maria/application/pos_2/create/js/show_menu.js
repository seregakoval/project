/* This function is for showing/hiding top right menu */

function show_hide_menu() {
    if (document.getElementById("top_nav").style.display === "none") {
        document.getElementById("top_nav").style.display = "block";
    } else if (document.getElementById("top_nav").style.display !== "none") {
        document.getElementById("top_nav").style.display = "none";
    }
}