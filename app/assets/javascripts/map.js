// $(document).on("ready", function() {
//   L.mapbox.accessToken = 'your access token';
//   var map = L.mapbox.map('map', 'Your map layer', { zoomControl: false })
//   .setView([39.739, -104.990], 12);
//
//   map.featureLayer.on("ready", function(e) {
//     getLocales(map);
//   });
// });
//
// function getLocales(map) {
//   var $loading_wheel = $("#spinning-wheel")
//   $loading_wheel.show();
//   $.ajax({
//     dataType: 'text',
//     url: '/locales.json',
//     success:function(locales) {
//       $loading_wheel.hide();
//       var geojson = $.parseJSON(locales);
//       map.featureLayer.setGeoJSON({
//         type: "FeatureCollection",
//         features: geojson
//       });
//       addLocalePopups(map);
//     },
//     error:function() {
//       $loading_wheel.hide();
//       alert("Could not load the locations");
//     }
//   });
// }
//
// function addLocalePopups(map) {
//   map.featureLayer.on("layeradd", function(e){
//     var marker = e.layer;
//     var properties = marker.feature.properties;
//     var popupContent = '<div class="marker-popup">' + '<h3>' + properties.title + '</h3>' +
//                        '<h4>' + properties.address + '</h4>' + '</div>';
//     marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
//   });
// }
