const apiUrl = 'http://localhost:8081'; // Replace with your server URL

function initMap() {
  const container = document.getElementById('map');
  const options = {
    center: new kakao.maps.LatLng(37.478762, 126.886691),
    level: 3
  };

  var map = new kakao.maps.Map(container, options);

  // 마커가 표시될 위치입니다 
  var markerPosition  = new kakao.maps.LatLng(37.478762, 126.886691); 

  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
      position: markerPosition
  });

  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);

  // Your map initialization code here...
  map.relayout();
}

// Load the Kakao Maps SDK asynchronously
(function() {
  const script = document.createElement('script');
  script.src = '//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ac82812245645874ac636a5806fc002c'; // Replace with your actual Kakao Maps app key
  document.head.appendChild(script);

  script.onload = () => {
    kakao.maps.load(() => {
      initMap();
    });
  };
})();

// company에서 오시는 길을 눌렀을 경우 지도 호출
var btn2 = document.getElementById("map1");
btn2.addEventListener("click", function() {initMap()});