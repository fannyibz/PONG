const getUserTime = () => {
  const addHours = document.getElementById("time-hour-more");
  const removeHours = document.getElementById("time-hour-less");
  const addMins = document.getElementById("time-min-more");
  const removeMins = document.getElementById("time-min-less");

  const hours = document.getElementById("time-hour");
  const mins = document.getElementById("time-min");

  // function ready(fn) {
        // if (document.readyState != 'loading'){
        //     fn();
        //   } else {
        //     document.addEventListener('DOMContentLoaded', fn);
        //   }
        // }
    let counterHours = parseInt(hours.innerHTML);
    let counterMins = parseInt(mins.innerHTML);


  addHours.addEventListener("mouseup", (events) => {
    if (counterHours < 24){
      counterHours += 1;
      hours.innerHTML = counterHours;
    }
  });

  removeHours.addEventListener("mouseup", (event) => {
    if (counterHours >= 1){
      counterHours -= 1;
      hours.innerHTML = counterHours;
    }
  });

   addMins.addEventListener("mouseup", (event) => {
    if (counterMins < 60){
      counterMins += 1;
      mins.innerHTML = counterMins;
    }
  });

  removeMins.addEventListener("mouseup", (event) => {
    if (counterMins >= 1){
      counterMins -= 1;
      mins.innerHTML = counterMins;
    }
  });

  // hours.addEventListener("mousedown", (event) => {
  //   counter -= 1;
  //   hours.innerHTML = counter;
  // });


}

export { getUserTime }
