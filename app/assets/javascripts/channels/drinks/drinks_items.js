
    //console.log("Connecting to channel: WordOfTheDayChannel")
    App.snippets = App.cable.subscriptions.create(
      {
        channel: 'DrinkItemsChannel', 
        restaurant_id: document.getElementById('restaurant_id').value,
      },
      { 
      connected: function(data){
        console.log("Connected to DrinkItemsChannel!");
       
        //console.log(data);
      },
      disconnected: function(data){
        console.log("Disonnected from DrinkItemsChannel!")
        // console.log(data);
      },
      received: function(data) {
        console.log("Received data from DrinkItemsChannel");
         $("#current-orders").html(data.html);
        // $('body').addClass('bg-danger');
        // $("#accept-button").show();
        // alert('DrinkItemsChannel Broacacast')


        // console.log("Data received: " + data)

        // console.log(data);
      },
    });


