
const getUserLocation = () => {
  const addressInput = document.getElementById("event_address");
  if (addressInput) {
    const addressCoordinates = document.getElementById("address_coordinates");
    navigator.geolocation.getCurrentPosition(function(position) {
      const lat = position.coords.latitude;
      const lon = position.coords.longitude;
      const url = `https://nominatim.openstreetmap.org/reverse?lat=${lat}&lon=${lon}&format=json`;
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          addressInput.value = `${data.address.road}, ${data.address.postcode}, ${data.address.city}, ${data.address.country}`;
          console.log(addressInput.value);
        });
    });
  }
}

export { getUserLocation }
