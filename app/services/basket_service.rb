class BasketService < ApplicationController

  def initialize(restaurant, basket)

    @restaurant = restaurant
    @basket = basket || { key: "#{@restaurant.id}-#{SecureRandom.uuid}" }.to_json

    key = JSON.parse(@basket)['key']
    
    key_restaurant_id = key.split('-').first.to_i
    #  binding.pry
    if @restaurant.id != key_restaurant_id
      cookies.delete :emenu_basket
      @basket = { key: "#{@restaurant.id}-#{SecureRandom.uuid}"}.to_json
    end

    key = JSON.parse(@basket)['key']
    @basket_db = Basket.where(key: key).first_or_create
    if @basket_db.contents.present?
      @basket_ids = @basket_db.contents
      @basket = basket_build(@basket_ids['ids'])
      @basket_item_count = @basket_ids['count']
      @basket_item_total = @basket['items'].map{|d| d['total']}.inject(:+)
    end
  end

  def get_basket
    @basket
  end

  def get_basket_db
    @basket_db
  end

  def get_basket_item_count
    @basket_item_count
  end

  def get_basket_item_total
    @basket_item_total
  end

  def add_to_basket(main_item, items, note)
    @basket = @basket_db.contents
    basket_ids =  @basket.present? ? @basket['ids'] : []

    items = items&.split(',')
    note = note&.gsub('|||','.')

    menu_item = Menu.find(main_item)
    optionals = CustomListItem.where(id: items)

    sort_order = @restaurant.custom_list_ids
    lookup = {}
    sort_order.each_with_index do |item, index|
      lookup[item] = index
    end

    cl = optionals.sort_by do |item|
      lookup.fetch(item.custom_list_id)
    end

    total = ("%.2f" % menu_item.price_a).to_f
    total += cl.map{|s| ("%.2f" % s.price).to_f }.inject(:+) if optionals.present?
    uuid = SecureRandom.uuid

    basket_ids << {uuid: uuid, total: total.round(2), note: note ,item: menu_item.id, optionals: cl.map{|s| s.id }, item_screen_type_key: menu_item.item_screen_type_key, menu_id: menu_item.id, item_screen_type_name: menu_item.item_screen_type_name }
    @basket_db.contents = {
      restaurant: @restaurant.id,
      count: basket_ids.count,
      # items: basket_items,
      ids: basket_ids
    }
    @basket_db.save

  end

  def get_menu_item
    @menu_item
  end

  def remove_from_basket(item_uuid)
    remove_basket_ids = @basket_db.contents['ids'].select{|a| a['uuid'] == item_uuid}.first
    @menu_item = Menu.find(remove_basket_ids['item'])

    basket_ids = @basket_db.contents['ids'].reject{|a| a['uuid'] == item_uuid}
    @basket_db.contents = {
      restaurant: @restaurant.id,
      count: basket_ids.count,
      # items: basket_items,
      ids: basket_ids 
    }
    @basket_db.save
    @basket = @basket_db.contents
  end
  
  def basket_build(ids)
    basket_items = []
    ids.each do |id|
      menu_item = Menu.find(id['item'])
      optionals = CustomListItem.where(id: id['optionals'])
      
      sort_order = @restaurant.custom_list_ids
      lookup = {}
      sort_order.each_with_index do |item, index|
        lookup[item] = index
      end

      cl = optionals.sort_by do |item|
        lookup.fetch(item.custom_list_id)
      end
      basket_items << {'uuid' => id['uuid'], 'total' => id['total'], 'note' => id['note'] ,'item' => "<i>#{menu_item.parent.name}</i> - <strong>#{menu_item.name}</strong>" , 'optionals' => cl.map{|s| "- <strong>#{s.name}</strong>" }, 'item_screen_type_name' => menu_item.item_screen_type_name, 'item_screen_type_key' => menu_item.item_screen_type_key, 'menu_id' => menu_item.id, 'secondary_item_screen_type_name' => menu_item.secondary_item_screen_type_name, 'secondary_item_screen_type_key' => menu_item.secondary_item_screen_type_key }
    end

    { 'items' => basket_items }

  end

  private


end