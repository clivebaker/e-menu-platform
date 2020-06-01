class Receipt < ApplicationRecord
  belongs_to :restaurant
  after_create :broadcast


  def broadcast

    ActionCable.server.broadcast("receipts_channel", {})
  
  end


    


end
