let countdown;

const dynamicCountdown = () => {
  if (document.querySelector(".timer")) {
    const timer = document.querySelector(".timer");
    const eventDate = timer.dataset.eventDate;
    console.log(timer);
    // Set a event date for my tests:
    // const eventDate = new Date();
    // eventDate.setHours(14);
    // eventDate.setMinutes(0);
    // eventDate.setSeconds(0);

    const timeRemaining = Date.parse(eventDate) - Date.parse(new Date());

    const hours = Math.floor(timeRemaining / (1000 * 60 * 60) % 24);
    const minutes = Math.floor((timeRemaining / 1000 / 60) % 60);
    const seconds = Math.floor((timeRemaining / 1000) % 60);

    if (timeRemaining < 0) {
      clearInterval(countdown);
      location.reload();
      return;
    }

    const display = `${hours < 10 ? '0' : ''}${hours}:${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    timer.textContent = display;
  }
}

setInterval(dynamicCountdown, 1000);

export { dynamicCountdown }
