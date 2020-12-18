import { Controller } from "stimulus";



export default class extends Controller {
  static values = {  url: String, refreshInterval: Number }


  connect() {
    this.load()

    if (this.hasRefreshIntervalValue) {
      this.startRefreshing()
    }
  }
 

  disconnect() {
    this.stopRefreshing()
  }

  load() {

    const notifIcon = document.querySelector(".notifications_icon")

      fetch(this.urlValue, { headers: { accept: "application/json"} })
      .then(response => response.json())
      .then(data => {
        if (notifIcon) {
          if (data.notifications_counter == 0) { 
            notifIcon.style.visibility = "hidden"
            notifIcon.classList.remove('notif_effect')
          } else {
              notifIcon.style.visibility = "visible"
              notifIcon.classList.add('notif_effect')
              this.element.innerHTML = data.notifications_counter;
          }
        } 
      });
  }

  startRefreshing() {
    this.refreshTimer = setInterval(() => {
      this.load()
    }, this.refreshIntervalValue)
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }
}