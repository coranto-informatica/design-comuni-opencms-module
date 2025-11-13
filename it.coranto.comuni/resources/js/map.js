const coordEl = document.getElementById("map");
const [lat, lng] = coordEl.dataset.coords
  .split(",")
  .map((coord) => parseFloat(coord.trim()));

const map = L.map("map").setView([lat, lng], 18);

L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution:
    '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

const icon = L.icon({
  iconUrl:
    "https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2_hdpi.png",
  iconSize: [27, 43],
  iconAnchor: [13, 41],
});

const marker = L.marker([lat, lng], { icon: icon }).addTo(map);

marker.on("click", () => {
  const gmapsUrl = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`;
  window.open(gmapsUrl, "_blank");
});
