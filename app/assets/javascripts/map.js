// // $(document).on("ready", function() {
// //   L.mapbox.accessToken = 'pk.eyJ1IjoiY2hyaXNweXl5IiwiYSI6ImNpbW1kZXl2MDAzM3h1Mmx1NzZvZW9haXEifQ.IRO_s_tGZNlP1JmGm03ISQ';
// //   var map = L.mapbox.map('map', 'Your map layer', { zoomControl: false })
// //   .setView([39.739, -104.990], 12);
//
// //   map.featureLayer.on("ready", function(e) {
// //     getFellows(map);
// //   });
// // });
//
// function getFellows(map) {
//   var $loading_wheel = $("#spinning-wheel")
//   $loading_wheel.show();
//   $.ajax({
//     dataType: 'text',
//     url: '/fellows.json',
//     success:function(fellows) {
//       $loading_wheel.hide();
//       var geojson = $.parseJSON(fellows);
//       map.featureLayer.setGeoJSON({
//         type: "FeatureCollection",
//         features: geojson
//       });
//       addFellowPopups(map);
//     },
//     error:function() {
//       $loading_wheel.hide();
//       alert("Could not load the fellows");
//     }
//   });
// }
//
// function addFellowPopups(map) {
//   map.featureLayer.on("layeradd", function(e){
//     var marker = e.layer;
//     var properties = marker.feature.properties;
//     var popupContent = '<div class="marker-popup">' + '<h3>' + properties.title + '</h3>' +
//                        '<h4>' + properties.address + '</h4>' + '</div>';
//     marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
//   });
// }
