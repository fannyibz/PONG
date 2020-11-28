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

  addHours.addEventListener("click", (event) => {

    let counter = parseInt(hours.innerHTML);
    counter += 1;
    document.getElementById("time-hour").innerHTML = counter;
    // localStorage.setItem('textSet', true);
    // hours.innerHTML.replace(innerHTML, counter)
    // ready(function(){
    //       if(localStorage.getItem('textSet')){
    //           document.getElementById("time-hour").innerHTML = counter;
    //       }
    //   })

  });


}

export { getUserTime }
