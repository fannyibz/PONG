const initClipboard = () => {
  const buttonShareLink = document.getElementById("share-link");
  
  if (buttonShareLink) {
    buttonShareLink.addEventListener("click", () => {
      const url = document.querySelector("meta[property='og:url']").getAttribute("content");
      navigator.clipboard.writeText(url);
    });
  }
  
  const markerAvatar = document.querySelector(".marker");
  
  if (markerAvatar) {
    markerAvatar.addEventListener("click", () => {
      setTimeout(function () {
        const idShowModal = document.getElementById("url-show-hidden").innerText;
        console.log(idShowModal);
        const buttonShareLinkModal = document.getElementById("share-link-modal");
  
        buttonShareLinkModal.addEventListener("click", () => {
          const url = `${document.querySelector("meta[property='og:url']").getAttribute("content")}events/${idShowModal}`;
          navigator.clipboard.writeText(url);
          });
      }, 100);
    });
  }
};
  
export { initClipboard };
