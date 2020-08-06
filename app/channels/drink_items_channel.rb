

class DrinkItemsChannel < ApplicationCable::Channel

  def subscribed
    # binding.pry
    stream_from "drink_items_channel_#{params[:restaurant_id]}"
  end

  def unsubscribed
    puts 'unsubscribed'
  end


end