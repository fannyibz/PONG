const toggleButtonNext = () => {

  if (document.querySelector(".event_emoji")) {
    const emojiBox = document.querySelectorAll(".emoji-box");
    console.log(emojiBox);
    
    emojiBox.forEach((box) => {
      box.addEventListener("click", (event) => {
        const nextButton = document.querySelector(".button-next");
        console.log(nextButton);
        nextButton.classList.remove("d-none");
      });
    });
  }
};

export { toggleButtonNext }
