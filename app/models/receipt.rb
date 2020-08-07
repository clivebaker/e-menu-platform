
class Receipt < ApplicationRecord
  belongs_to :restaurant
  after_create :broadcast
  after_create :creation_print
  after_create :item_breakdown

  delegate :id, to: :restaurant, prefix: true

  def item_breakdown

    item_screens = ItemScreen.where(restaurant_id: restaurant_id).joins(:item_screen_type).where("item_screen_types.key <> 'FULL'")
    if item_screens.present?
      items['items'].each do |item|
        ScreenItem.create(restaurant_id: restaurant_id, menu_id: item['menu_id'], receipt_id: id, item_screen_type_key: item['item_screen_type_key'], uuid: item['uuid'])
      end
      broadcast_items
    end
  end

  def broadcast_items

    @printers = Printer.where(restaurant_id: restaurant_id)
    html_food  = ApplicationController.render(partial: "manager/live/order_items_screen_specific", locals: { printers: @printers, restaurant: restaurant_id, item_screen_type_key: 'FOOD' })
    html_drinks  = ApplicationController.render(partial: "manager/live/order_items_screen_specific", locals: { printers: @printers, restaurant: restaurant_id, item_screen_type_key: 'DRINK' })

    ActionCable.server.broadcast("food_items_channel_#{restaurant_id}", {html: html_food})
    ActionCable.server.broadcast("drink_items_channel_#{restaurant_id}", {html: html_drinks})
  end


  def creation_print
    item_screens = ItemScreen.where(restaurant_id: restaurant_id).joins(:item_screen_type).where("item_screen_types.key = 'FULL'")
    item_screen = nil
    item_screen = item_screens.first if item_screens.present?

    if item_screen.present?
      buzz = item_screen.buzz_on_new
      print = item_screen.on_new
      action = nil
      action = 'print' if print
      action = 'buzz' if buzz
      action = 'print_buzz' if print and buzz
      if action.present? and item_screen.printer.present?
        print_receipt(item_screen.printer, action)
      end
    end
  end
  


  


  def broadcast
    @printers = Printer.where(restaurant_id: restaurant_id)
    html  = ApplicationController.render(partial: "manager/live/order_items", locals: { printers: @printers, restaurant: restaurant_id })
    # binding.pry
    data = {html: html}   
    ActionCable.server.broadcast("receipts_channel_#{restaurant_id}", data)
  end

  def print_receipt(printer, action='print')
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
    data = {print_type: printer.print_type, action: action, header: header, print_receipt: print_receipt, printer_vendor: printer.vendor, printer_product: printer.product}

    ActionCable.server.broadcast("printers_channel_#{restaurant_id}_#{printer.pi_interface_server_token}", data)
  end

  after_create :email_receipt

  def email_receipt
    if email.present?
      ApplicationMailer.receipt(id).deliver_now
    end
  end

end
