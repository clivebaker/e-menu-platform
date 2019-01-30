# frozen_string_literal: true

module TablesHelper

  def custom_list_options(custom_lists)
    ret_string = "<strong>#{t('menu.choose_below')}</strong><br>"
    custom_lists.keys.each do |custom_list_key| 
      custom_list =  CustomList.find(custom_list_key)
      checkbox_list = ""
      CustomListItem.where(id: custom_lists[custom_list_key]).each do |item| 
        checkbox_list += %Q(
            <div class="collection-check-box">
              <input type="#{custom_list.input_type}" value="#{item.id}" name="table[custom_lists][#{custom_list.id}][]" id="menu_custom_lists_#{custom_list.id}-#{item.id}", class="custom_list_option" >
              <i class="">#{item.name} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #{number_to_currency(item.price, unit: "£") if item.price > 0}</i>
            </div>
         )
      end 
      ret_string += %Q(
       <div class="row mb-2">
       <div class="col">
         <strong>#{custom_list.name}</strong>  (#{constraint_to_human(custom_list.constraint)})
          #{checkbox_list}
       </div>
       </div>)
    end
      
    if custom_lists.keys.present?   
      ret_string
    else
      ""
    end
  end




  def feature_match(feature, restaurant_features)


    restaurant_features.map{|s| s.key.to_sym}.include?(feature.to_sym)

    
  end




end
