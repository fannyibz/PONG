const changeNavbarButton = () => {

  const navbarBox = document.querySelectorAll(".navbar-icon-box");
  
  navbarBox.forEach((box) => {
    box.addEventListener("click", (event) => {

      const navbarBoxActive = document.querySelector(".navbar-icon-box-active");
      
      navbarBoxActive.classList.remove("navbar-icon-box-active");
      event.currentTarget.classList.add("navbar-icon-box-active");
      console.log(event.currentTarget);
    });
  });
};

export { changeNavbarButton }
