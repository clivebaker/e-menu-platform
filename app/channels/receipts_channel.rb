

class ReceiptsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "receipts_channel"
  end


end