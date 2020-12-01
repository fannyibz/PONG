// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// ActionCable
import { initChatroomCable } from '../channels/chatroom_channel';

// Own JS functions
import { toggleButtonNext } from '../components/toggleButtonNext';
import { togglePongTitle } from '../components/togglePongTitle';

//Flatpickr
import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
});

// Mapbox
import { initMapbox } from '../plugins/init_mapbox';
import { getUserLocation } from '../components/get_user_location';
import { initSweetAlert } from '../plugins/sweet_alert';

 initSweetAlert('#share-my-plan', {
        title: "Congratulations !",
        text: "You've shared your plan !",
        icon: "success",
        button: "See my plan",
        }, (value) => {
          if (value) {
            const link = document.querySelector('#edit-friends-submit');
            link.click();
        }
      });

getUserLocation();

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  getUserLocation();
  initChatroomCable();
  toggleButtonNext();
  togglePongTitle();

})


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
// });
