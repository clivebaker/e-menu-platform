class Receipt < ApplicationRecord
  belongs_to :restaurant
  after_create :broadcast

  def broadcast

    html  = ApplicationController.render(partial: "manager/live/order_items", locals: { restaurant: restaurant_id })
    # print_receipt = ApplicationController.render(partial: "manager/live/order_items_print", locals: { restaurant: restaurant_id })
    #lsusb
    # printer_vendor = '0x0525'
    # printer_product = '0xa700'    
    data = {html: html}   
    # data = {html: html, print_receipt: print_receipt, printer_vendor: printer_vendor, printer_product: printer_product}   
    ActionCable.server.broadcast("receipts_channel_#{restaurant_id}", data)
  
  end

  def print_receipt(printer)
    puts 'Hello'
    print_receipt = ApplicationController.render(partial: "manager/live/order_items_print", locals: { receipt: self, restaurant: restaurant_id })
    print_receipt = print_receipt.gsub("&amp;","&").gsub("£","")
    header = ""
    header << "Name: #{name}\n" if delivery_or_collection != 'tableservice' 
    header << "Time: #{collection_time}\n" if delivery_or_collection != 'tableservice' 
    header << "Type: #{delivery_or_collection}\n" 
    header << "Table Number: #{table_number}\n" if delivery_or_collection == 'tableservice' 
    header << "Tel: #{telephone}\n" if telephone.present? 
    header << "Address: #{address}\n" if delivery_or_collection == 'delivery'
    header << "\n\n"
    data = {print_type: printer.print_type, action: 'print', header: header, print_receipt: print_receipt, printer_vendor: printer.vendor, printer_product: printer.product}
    
    ActionCable.server.broadcast("printers_channel_#{restaurant_id}_#{printer.pi_interface_server_token}", data)
  end

  after_create :email_receipt

  def email_receipt
    if email.present?
      ApplicationMailer.receipt(id).deliver_now
    end
  end

end
