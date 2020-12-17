const dynamicCountdown = () => {
  if (document.querySelector(".timer")) {
    const eventTime = new Date();
    eventTime.setHours(20);
    eventTime.setMinutes(0);
    eventTime.setSeconds(0);

    console.log(eventTime);

    const timeRemaining = Date.parse(eventTime) - Date.parse(new Date());
    
    const hours = Math.floor(timeRemaining / (1000 * 60 * 60) % 24);
    const minutes = Math.floor((timeRemaining / 1000 / 60) % 60);
    const seconds = Math.floor((timeRemaining / 1000) % 60);
    
    console.log(timeRemaining);
    console.log(hours);
    console.log(minutes);
    console.log(seconds);

    const timerDisplay = document.querySelector(".timer");
    const display = `${hours < 10 ? '0' : ''}${hours}:${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    timerDisplay.textContent = display;
  }
}

setInterval(dynamicCountdown, 1000);

export { dynamicCountdown }
