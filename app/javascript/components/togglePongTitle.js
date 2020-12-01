const togglePongTitle = () => {

  if (document.querySelector(".marker")) {
    const markerPopup = document.querySelectorAll(".marker");
    const map = document.querySelector(".mapboxgl-canvas");
    
    markerPopup.forEach((marker) => {
      marker.addEventListener("click", (event) => {
        const bgShadow = document.querySelector(".background-shadow");
        const pongTitle = document.getElementById("pong-title");

        bgShadow.classList.add("d-none");
        pongTitle.classList.add("d-none");
      });
    });

    map.addEventListener("click", (event) => {
      const bgShadow = document.querySelector(".background-shadow");
      const pongTitle = document.getElementById("pong-title");

      bgShadow.classList.remove("d-none");
      pongTitle.classList.remove("d-none");
    });
  }
};

export { togglePongTitle }
