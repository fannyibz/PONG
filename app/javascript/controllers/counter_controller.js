import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

    connect = () => {
      setInterval(this.refresh, 10000);
    }

    refresh = () => {
      fetch('/', { headers: { accept: "application/json"} })
    	.then(response => response.json())
    	.then(data => {
    		console.log(data.notifications_counter)
    		this.countTarget.innerText = data.notifications_counter;
    	});
    }
}