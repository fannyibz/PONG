import mapboxgl from 'mapbox-gl'; // Mapbox, initiate
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder'; // Mapbox, searching on your map

const initMapboxEventCreation = () => {
  const mapElement = document.getElementById('mapEventCreation');
  if (!mapElement) return;
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'mapEventCreation',
    style: 'mapbox://styles/fannyibz/ckjtvswmr0qkc19ncx03wrp2z'
  });

  const locationControl = (map) => {
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    })
    map.addControl(geolocate);
    map.on("load", function(e) {
      geolocate.trigger();
      console.log("hello");
    })
    geolocate.on("geolocate", function(e) {
      map.flyTo({
        zoom: 12,
        center: [e.coords.longitude, e.coords.latitude]
      });
      console.log("hello");
      // const currentLatitudeInput = document.getElementById('event_current_latitude')
      // const currentLongitudeInput = document.getElementById('event_current_longitude')
      // currentLatitudeInput.value = e.coords.latitude;
      // currentLongitudeInput.value = e.coords.longitude;
    })
  };

  locationControl(map);
};


export { initMapboxEventCreation };

