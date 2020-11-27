
const getUserLocation = () => {
  const addressInput = document.getElementById("event_address");
  if (addressInput) {
    const addressCoordinates = document.getElementById("address_coordinates");
    navigator.geolocation.getCurrentPosition(function(position) {
      console.log(position);
      const lat = position.coords.latitude;
      const long = position.coords.longitude;
      addressCoordinates.innerHTML = `${lat} - ${long}`
    });
  }
}
export { getUserLocation }
