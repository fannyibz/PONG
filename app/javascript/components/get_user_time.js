const getUserTime = () => {
  if (document.getElementById("time-hour-more")) {


  const addHours = document.getElementById("time-hour-more");
  const removeHours = document.getElementById("time-hour-less");
  const addMins = document.getElementById("time-min-more");
  const removeMins = document.getElementById("time-min-less");

  const hours = document.getElementById("time-hour");
  const mins = document.getElementById("time-min");

  // let counterHours = parseInt(hours.innerHTML);
  // let counterMins = parseInt(mins.innerHTML);

  const simpleFormHour = document.getElementById("event_date_time_4i");
  const simpleFormMin = document.getElementById("event_date_time_5i");

  hours.innerHTML = simpleFormHour.value;
  mins.innerHTML = simpleFormMin.value;

  addHours.addEventListener("mouseup", (events) => {
    let hValue = parseInt(simpleFormHour.value);
    hValue++
    if (hValue === 24) hValue = 0;
    simpleFormHour.value = hValue;
    if (hValue < 10) {
      hours.innerHTML = '0' + hValue;
      simpleFormHour.value = '0' + hValue;
    } else {
      hours.innerHTML = hValue;
    }
  });

  removeHours.addEventListener("mouseup", (event) => {
    const hValue = parseInt(simpleFormHour.value)
    if (hValue === 0) {
      simpleFormHour.value = "23";
    } else if (hValue <= 10) {
      simpleFormHour.value = `0${hValue - 1}`
    } else {
      simpleFormHour.value = hValue - 1;
    }

    displayTime(simpleFormHour, hours)
  });

   addMins.addEventListener("mouseup", (event) => {
    const mValue = parseInt(simpleFormMin.value);
    let mValueRounded = mValue - (mValue % 5);
    console.log(mValueRounded);
    mValueRounded += 5
    if (mValueRounded === 60) mValueRounded = 0;
    simpleFormMin.value = mValueRounded;
    if (mValueRounded < 10) {
      mins.innerHTML = '0' + mValueRounded;
      simpleFormMin.value = '0' + mValueRounded;
    } else {
      mins.innerHTML = mValueRounded;
    }
  });

    removeMins.addEventListener("mouseup", (event) => {
      const mValue = parseInt(simpleFormMin.value);
      const mValueRounded = mValue - (mValue % 5);
      console.log(mValueRounded);
      if (mValueRounded === 0) {
        simpleFormMin.value = "55";
      } else if (mValueRounded <= 10) {
        simpleFormMin.value = `0${mValueRounded - 5}`
      } else {
        simpleFormMin.value = mValueRounded - 5;
      }
      displayTime(simpleFormMin, mins);

    });
  };
  }


function displayTime(inputElement, displayElement) {
  displayElement.innerHTML = inputElement.value;
}


export { getUserTime }
