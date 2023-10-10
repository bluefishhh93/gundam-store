/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */




/////////////////////////////////////////////////////////////////////////
////Pagination li
//  // Lấy danh sách tất cả các thẻ <li>
//  const paginationItems = document.querySelectorAll(".pagination-item");
//
//  // Lặp qua từng thẻ <li> để thêm sự kiện click
//  paginationItems.forEach(function (item) {
//    item.addEventListener("click", function () {
//      // Xóa lớp "active" cho tất cả các thẻ <li>
//      paginationItems.forEach(function (item) {
//        item.classList.remove("pagination-item--active");
//      });
//
//      // Thêm lớp "active" cho thẻ <li> được nhấp vào
//      this.classList.add("pagination-item--active");
//    });
//  });
////////////////////////////////////////////////////////////////////////
//document.querySelectorAll('.select-input__link').forEach(item => {
//  item.addEventListener('click', event => {
//    // event.preventDefault(); 
//    document.querySelector(".select-input__label").textContent = item.textContent;
//    // document.querySelector(".select-input__label").style.color = "rgb(79, 123, 204)";
//  })
//});



//////////////////////////////////////////////////////////////////////  

const buttons = document.querySelectorAll('.home-filter__btn');

buttons.forEach(button => {
    button.addEventListener('click', () => {
        // Remove the btn--primary class from all buttons
        buttons.forEach(btn => btn.classList.remove('btn--primary'));

        // Add the btn--primary class to the clicked button
        button.classList.add('btn--primary');
    });
});

//const returnBtnEl = document.getElementById('return');
//returnBtnEl.addEventListener("click", function() {
//    const feedbackElements = document.querySelectorAll(".feedback");
//    feedbackElements.forEach(function(element) {
//        element.style.display = "none";
//    });
//    document.querySelector(".modal").style.display = "none";
//
//});


feedbackFormEl = document.querySelectorAll('.feedback-form');
returnButtonsEl = document.querySelectorAll('.btn--normal');
returnButtonsEl.forEach(button => {
    button.addEventListener('click', () => {
        document.querySelector(".modal").style.display = "none";
    });
})

returnFeedbackEl = document.querySelectorAll('.return');
returnFeedbackEl.forEach(button => {
    button.addEventListener('click', () => {
        document.querySelector(".modal").style.display = "none";
        var feedbackDivs = document.querySelectorAll('form.feedback-form');
        for (var i = 0; i < feedbackDivs.length; i++) {
            feedbackDivs[i].style.display = 'none';
        }
    });
})


// /////////////////////////////////////////////////////////////////////
const switchButtonsEl = document.querySelectorAll('.auth-form__switch-btn');
switchButtonsEl[0].addEventListener('click', login);
switchButtonsEl[1].addEventListener('click', register);

////////////////////////////////////////////////////////////////////////

//Display Login and Register Form
const loginButtonEl = document.querySelector('.login-button');
const registerButtonEl = document.querySelector('.register-button');
loginButtonEl.addEventListener("click", login);
registerButtonEl.addEventListener("click", register);



function register() {
    document.querySelector(".modal").style.display = "block";
    document.querySelector(".register").style.display = "block";
    document.querySelector(".login").style.display = "none";
//    document.querySelector(".feedback").style.display = "none";

}

function login() {
    document.querySelector(".modal").style.display = "block";
    document.querySelector(".login").style.display = "block";
    document.querySelector(".register").style.display = "none";
//    document.querySelector(".feedback").style.display = "none";
}


function feedback(orderId) {
    document.querySelector(".modal").style.display = "block";
    document.getElementById(`feedback${orderId}`).style.display = "block";
    document.querySelector(".register").style.display = "none";
    document.querySelector(".login").style.display = "none";

}
////////////////////////////////////////////////////////////////////





