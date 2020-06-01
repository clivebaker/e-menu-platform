App.room = App.cable.subscriptions.create "ReceiptsChannel",
  received: (data) ->
    console.log("Hello World"+data)
    location.reload();

    message = data
    # $('#messages').html "<image src='"+message['image']+"' class='responsive-img'>"
    
    # $('#messages').click ->
    #   console.log("Message Clicked!")