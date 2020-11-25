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
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    // Custom markers AVATAR
    // 1-Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
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
    emoji.style.marginTop = '30px';
    emoji.style.marginLeft = '-26px';
    emoji.insertAdjacentHTML("afterbegin",`<p>${marker.emoji}</p>`)


    // 2-Pass the emoji as an argument to the new marker
    new mapboxgl.Marker(emoji)
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);

  });

  // Mapbox, searching on your map
  map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));

  // Mapbox, fit map to markers
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

export { initMapbox };
