class Receipt < ApplicationRecord
  belongs_to :restaurant
  after_create :broadcast

  def broadcast


		data = {html: ApplicationController.render(partial: "manager/live/order_items", locals: { restaurant: restaurant_id })}   #, locals: {weather: self})}

    ActionCable.server.broadcast("receipts_channel", data)
  
  end

  after_create :email_receipt

  def email_receipt
    if email.present?
      ApplicationMailer.receipt(id).deliver_now
    end
  end

end
