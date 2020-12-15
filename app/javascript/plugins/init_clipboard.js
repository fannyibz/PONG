import swal from 'sweetalert';

const initClipboard = () => {
  const buttonShareLink = document.getElementById("share-link");

  if (buttonShareLink) {
    buttonShareLink.addEventListener("click", () => {
      const url = document.querySelector("meta[property='og:url']").getAttribute("content");
      navigator.clipboard.writeText(url);
      swal ({
        title: "Link copied !",
        // text: "Your link has been copied",
        icon: "success",
        button: false,
        className: "copy-link-swal",
        timer: 1500,
      });
    });
  }

  const markerAvatar = document.querySelectorAll(".marker");

  if (markerAvatar) {
    markerAvatar.forEach((marker) => {
      marker.addEventListener("click", () => {
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
    });
  }
};

export { initClipboard };
