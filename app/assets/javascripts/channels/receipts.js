
    //console.log("Connecting to channel: WordOfTheDayChannel")
    App.snippets = App.cable.subscriptions.create('ReceiptsChannel', { 
      connected: function(data){
        console.log("Connected to ReceiptsChannel!");
       
        //console.log(data);
      },
      disconnected: function(data){
        console.log("Disonnected from ReceiptsChannel!")
        // console.log(data);
      },
      received: function(data) {
        console.log("Received data from ReceiptsChannel");
        $("#current-orders").html(data.html);
        $('body').addClass('bg-danger');
        $("#accept-button").show();



        // console.log("Data received: " + data)

        // console.log(data);
      },
    });


