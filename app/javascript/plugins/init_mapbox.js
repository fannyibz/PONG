import mapboxgl from 'mapbox-gl'; // Mapbox, initiate
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder'; // Mapbox, searching on your map

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const addressInput = document.getElementById("event_address");

  if (!mapElement) return;

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/hahahadrien/ckhvtwp2f083919p5pg8jfyxa'
  });

  const locationControl = (map) => {
    const geolocate =  new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        // fitBoundsOptions: {maxZoom: 20},
        // showAccuracyCircle: false
      })
      map.addControl(geolocate);

      map.on("load", function(e) {
        geolocate.trigger();
      })

      geolocate.on("geolocate", function(e) {
        map.flyTo({
          zoom: 11,
          center: [e.coords.longitude, e.coords.latitude]
        });
      })
    };


  const markers = JSON.parse(mapElement.dataset.markers); // Mapbox, add markers
  if (markers !== null) {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      // Custom markers AVATAR
      // 1-Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      if (marker.grey_marker) {
        element.className = 'marker grey-marker'
      }
      if (marker.joined) {
        element.classList.add('avatar-profile-selected')
      }
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '50px';
      element.style.height = '50px';
      element.style.borderRadius = '50%';


      // 2-Pass the element as an argument to the new marker
      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);

      // Custom markers EMOJI
      // 1-Create a HTML element for your custom marker
      const emoji = document.createElement('div');
      emoji.className = 'emoji';
      // emoji.style.content = `${marker.emoji}`;
      emoji.style.fontSize = '30px';
      emoji.style.marginTop = '20px';
      emoji.style.marginLeft = '-20px';
      emoji.insertAdjacentHTML("afterbegin",`<p>${marker.emoji}</p>`)


      // 2-Pass the emoji as an argument to the new marker
      new mapboxgl.Marker(emoji)
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);

   });
  }

  if (addressInput) {
    if (addressInput.value != "") {

    }
  }
  // Mapbox, searching on your map

  // map.addControl(new MapboxGeocoder({
  //   accessToken: mapboxgl.accessToken,
  //   mapboxgl: mapboxgl,
  //   placeholder: 'Search for location...'
  // }));

  // Mapbox, fit map to markers
  const bounds = new mapboxgl.LngLatBounds();
  if (markers !== null) {
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
  }
  locationControl(map);
};


export { initMapbox };
