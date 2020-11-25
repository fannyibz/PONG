import mapboxgl from 'mapbox-gl'; // Mapbox, initiate
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder'; // Mapbox, searching on your map

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (!mapElement) return;

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/hahahadrien/ckhvtwp2f083919p5pg8jfyxa' // <-- use your own to styling your map
  });

  const markers = JSON.parse(mapElement.dataset.markers); // Mapbox, add markers
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });

  // Mapbox, searching on your map
  map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));

  fitMapToMarkers(map,markers)
};

// Mapbox, fit map to markers
const fitMapToMarkers = (map, markers) => {

  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


// Mapbox, info-window
const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    // Custom markers
    // 1-Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    // 2-Pass the element as an argument to the new marker
    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

export { initMapbox };
