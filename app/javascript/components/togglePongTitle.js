const togglePongTitle = () => {

  if (document.querySelector(".marker")) {
    const markerPopup = document.querySelectorAll(".marker");
    console.log(markerPopup);
    
    markerPopup.forEach((marker) => {
      marker.addEventListener("click", (event) => {
        const bgShadow = document.querySelector(".background-shadow");
        const pongTitle = document.getElementById("pong-title");

        bgShadow.classList.add("d-none");
        pongTitle.classList.add("d-none");
      });
    });
  }
};

export { togglePongTitle }
