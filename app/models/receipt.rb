class Receipt < ApplicationRecord
  belongs_to :restaurant
  after_create :broadcast


  def broadcast

    ActionCable.server.broadcast("receipts_channel", {})
  
  end


  after_create :email_receipt


  def email_receipt
    if email.present?
      ApplicationMailer.receipt(id).deliver_now
    end
  end

    


end
