import swal from 'sweetalert';
// import React from 'react';
// import swal from '@sweetalert/with-react';

const initSweetAlert = () =>{
  const shareMyPlanBtn = document.getElementById("share-my-plan");
  shareMyPlanBtn.addEventListener("click", (event) => {
    event.preventDefault();
    swal({
      title: "Congratulations",
      text: "You've shared your plan!You'll be notified when someone answers",
      button: "See plan",
      icon: "success",
    }).then(okay => {
   if (okay) {
    window.location.href = "URL";
      }
    });
  });
}


export { initSweetAlert };