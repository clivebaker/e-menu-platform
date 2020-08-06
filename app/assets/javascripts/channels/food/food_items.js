
    //console.log("Connecting to channel: WordOfTheDayChannel")
    App.snippets = App.cable.subscriptions.create(
      {
        channel: 'FoodItemsChannel', 
        restaurant_id: document.getElementById('restaurant_id').value,
      },
      { 
      connected: function(data){
        console.log("Connected to FoodItemsChannel!");
       
        //console.log(data);
      },
      disconnected: function(data){
        console.log("Disonnected from FoodItemsChannel!")
        // console.log(data);
      },
      received: function(data) {
        console.log("Received data from FoodItemsChannel");
        $("#current-orders").html(data.html);
        // $('body').addClass('bg-danger');
        // $("#accept-button").show();
        // alert('FoodItemsChannel Broacacast')


        // console.log("Data received: " + data)

        // console.log(data);
      },
    });


