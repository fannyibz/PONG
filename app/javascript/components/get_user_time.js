const getUserTime = () => {
  const addHours = document.getElementById("time-hour-more");
  const removeHours = document.getElementById("time-hour-less");
  const addMins = document.getElementById("time-min-more");
  const removeMins = document.getElementById("time-min-less");

  const hours = document.getElementById("time-hour");
  const mins = document.getElementById("time-min");

  let counterHours = parseInt(hours.innerHTML);
  let counterMins = parseInt(mins.innerHTML);

  const simpleFormHour = document.getElementById("event_date_time_4i");
  const simpleFormMin = document.getElementById("event_date_time_5i");
  hours.innerHTML = simpleFormHour.value;
  mins.innerHTML = simpleFormMin.value;
  addHours.addEventListener("mouseup", (events) => {

    const hValue = parseInt(simpleFormHour.value)
       if (hValue === 24) {
      simpleFormHour.value = 0;
    } else if (hValue <= 10) {
      simpleFormHour.value = `0${hValue + 1}`
    } else {
      simpleFormHour.value = hValue + 1;
    }

    displayTime(simpleFormHour, hours)

  });

  removeHours.addEventListener("mouseup", (event) => {

    const hValue = parseInt(simpleFormHour.value)

   addMins.addEventListener("mouseup", (event) => {
    const mValue = parseInt(simpleFormMin.value);
    const mValueRounded = mValue - (mValue % 5);
    console.log(mValueRounded);
      if (hValue === 55) {
        simpleFormHour.value = "5";
      } else if (hValue <= 10) {
        simpleFormHour.value = `0${hValue + 5}`:
      } else {
        simpleFormHour.value = hValue + 5;
      }
      displayTime(simpleFormHour, hours)
  });

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

}

function displayTime(inputElement, displayElement) {
  displayElement.innerHTML = inputElement.value;
}

function changeHour(simpleFormInput, counterInput) {
  simpleFormInput.value = counterInput;
}

export { getUserTime }
