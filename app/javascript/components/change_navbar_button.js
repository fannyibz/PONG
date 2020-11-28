const changeNavbarButton = () => {

  const navbarBoxActive = document.querySelector(".navbar-icon-box-active")
  const navbarBox = document.querySelectorAll(".navbar-icon-box");

  navbarBox.forEach((box) => {
    box.addEventListener("click", (event) => {
      navbarBoxActive.classList.remove("navbar-icon-box-active")
      event.currentTarget.classList.add("navbar-icon-box-active");
      console.log(event.currentTarget);
    });
  });
};

export { changeNavbarButton }
