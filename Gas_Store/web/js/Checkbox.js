

//Get the button
let mybutton = document.getElementById("btn-back-to-top");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    if (
            document.body.scrollTop > 100 ||
            document.documentElement.scrollTop > 100
            ) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}
// When the user clicks on the button, scroll to the top of the document
mybutton.addEventListener("click", backToTop);

function backToTop() {
    // Lấy vị trí hiện tại của trang
    const currentScroll = document.documentElement.scrollTop || document.body.scrollTop;

    // Nếu vị trí cuộn không phải là 0, cuộn mượt đến đầu trang
    if (currentScroll > 0) {
        window.requestAnimationFrame(backToTop);
        window.scrollTo(0, currentScroll - currentScroll / 8); // Điều chỉnh tốc độ cuộn tại đây
    }
}



