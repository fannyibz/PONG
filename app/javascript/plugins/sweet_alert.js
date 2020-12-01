import swal from 'sweetalert';
// import React from 'react';
// import swal from '@sweetalert/with-react';

const initSweetAlert = (selector, options = {}, callback = () => {}) =>{
  const swalButton = document.querySelector(selector);
  // event.preventDefault();
  if (swalButton) {
    swalButton.addEventListener("click", (e) => {
      e.preventDefault();
      swal(options).then(callback);
    });
  }
}


export { initSweetAlert };
