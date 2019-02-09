var myMap = L.map("map", {
  center: [35.8283, -98.5795],
  zoom: 4.45
});

L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
  attribution: "Map data &copy; <a href='https://www.openstreetmap.org/'>OpenStreetMap</a> contributors, <a href='https://creativecommons.org/licenses/by-sa/2.0/'>CC-BY-SA</a>, Imagery © <a href='https://www.mapbox.com/'>Mapbox</a>",
  maxZoom: 18,
  id: "mapbox.satellite",
  accessToken: API_KEY
}).addTo(myMap);

L.geoJson(statesData).addTo(myMap);

var url = "https://api.myjson.com/bins/uyna0";

console.log(url)

d3.json(url).then(function(response) {

  console.log(response);

  var heatArray = [];

  for (var i = 0; i < response.length; i++) {
    var latitude = response[i].lat;
    var longitude = response[i].long;

    heatArray.push([latitude, longitude]);
    }

    console.log(heatArray);

    heat = L.heatLayer(heatArray, {
      radius: 8,
      blur: 13,
      minOpacity: 1000
      }).addTo(myMap);      
  
});

var newtry = "https://api.myjson.com/bins/pmu6o";

d3.json(newtry).then(function(response) {

  console.log(response);

  var markers = L.markerClusterGroup();

  // Loop through data
  for (var i = 0; i < response.length; i++) {

    // Set the data location property to a variable
    var latitude = response[i].lat;
    var longitude = response[i].long;
    var popup = 

    // Check for location property
    // Add a new marker to the cluster group and bind a pop-up
      markers.addLayer(L.marker([latitude, longitude])
        .bindPopup(response[i].mil_base_name, response[i].component, response[i].operational_status));
    
  }
  // Add our marker cluster layer to the map
  myMap.addLayer(markers);

})