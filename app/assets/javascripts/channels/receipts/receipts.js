//console.log("Connecting to channel: WordOfTheDayChannel")
App.snippets = App.cable.subscriptions.create(
 {
  channel: "ReceiptsChannel",
  restaurant_id: document.getElementById("restaurant_id").value,
 },
 {
  connected: function (data) {
   console.log("Connected to ReceiptsChannel!");

   //console.log(data);
  },
  disconnected: function (data) {
   console.log("Disonnected from ReceiptsChannel!");
   // console.log(data);
  },
  received: function (data) {
   console.log("Received data from ReceiptsChannel");
   $("#current-orders").html(data.html);
   $("body").addClass("bg-danger");
   $("#accept-button").show();
   new Audio(data.sound_file_path).play();

   // console.log("Data received: " + data)

   // console.log(data);
  },
 }
);
