class PiInterface < ApplicationRecord
  has_many :printers

  before_destroy :remove_printers


  def remove_printers
    printers.delete_all
  end

  def request_lsusb

    self.lsusb_compare = lsusb
    self.lsusb = nil
    save

    data = {action: 'lsusb'}   
    ActionCable.server.broadcast("printers_channel_#{restaurant_id}_#{server_token}", data)

  end
end
