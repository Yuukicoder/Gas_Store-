/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Lấy ra tất cả các phần tử có class là 'num'
var priceElements = document.querySelectorAll('.num');

// Lặp qua từng phần tử để thay đổi định dạng tiền tệ
priceElements.forEach(function (element) {
    var price = parseInt(element.textContent); // Lấy giá trị số nguyên từ nội dung của phần tử
    var formattedPrice = formatCurrency(price); // Định dạng tiền tệ
    element.textContent = formattedPrice; // Gán lại nội dung đã định dạng vào phần tử
});

// Hàm để định dạng tiền tệ sang VND
function formatCurrency(amount) {
    return 'VND ' + amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

