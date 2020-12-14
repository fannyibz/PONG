const initClipboard = () => {
  const buttonShareLink = document.getElementById("share-link");
  const markerAvatar = document.querySelector(".marker");
  const buttonShareLinkModal = document.getElementById("share-link-modal");

  if (buttonShareLink) {
    buttonShareLink.addEventListener("click", (event) => {
      event.preventDefault();

      const url = document.querySelector("meta[property='og:url']").getAttribute("content");
      navigator.clipboard.writeText(url);
    });
  }

  // if (markerAvatar) {
  //   markerAvatar.addEventListener("click", () => {
  //     buttonShareLinkModal.addEventListener("click", () => {
  //       console.log("test");
  //       console.log("salut je m'appelle Maaaaaag");
  //       const idShowModal = document.getElementById("event-show-title");
  //       console.log(idShowModal);
  //     });
  //   });
  // }
  
  
  // buttonShareLinkModal.addEventListener("click", (event) => {
    // const url = document.querySelector("meta[property='og:url']").getAttribute("content");
    // navigator.clipboard.writeText(url);
    // });
  };
  
  export { initClipboard };
  