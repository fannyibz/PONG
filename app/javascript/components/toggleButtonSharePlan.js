const toggleButtonSharePlan = () => {

  if (document.getElementById("event-pick-friends")) {
    const friendsBox = document.querySelectorAll(".avatar-friend");
    console.log(friendsBox);

    friendsBox.forEach((box) => {
      box.addEventListener("click", (event) => {
        const shareCancelButton = document.querySelector(".box-btn-share-cancel-plan");
        console.log(shareCancelButton);
        shareCancelButton.classList.remove("d-none");
      });
    });
  }
};

export { toggleButtonSharePlan }
