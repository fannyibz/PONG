
const getUserLocation = () => {
  const addressInput = document.getElementById("event_address");
  if (addressInput ) {
    if (addressInput.value != "") return;
    const addressCoordinates = document.getElementById("address_coordinates");
    navigator.geolocation.getCurrentPosition(function(position) {
      const lat = position.coords.latitude;
      const lon = position.coords.longitude;
      const url = `https://nominatim.openstreetmap.org/reverse?lat=${lat}&lon=${lon}&format=json`;
      console.log(url);
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          const address = data.address;
          const addressElements = [
            address.house_number,
            address.road,
            address.postcode,
            address.town || address.city,
            address.country
          ];
          console.log(addressElements.join(' '));
          console.log(data)
          addressInput.value = addressElements.join(' ');
        });
    });
  }
}

export { getUserLocation }
