# frozen_string_literal: true

module TablesHelper
  # def node_print(level)
  #   "<div class='row'><div class='col'>#{render "tables/#{level.node_type}", menu: level, level: 1}</div></div>".html_safe
  # end

  # def render_nested_groups(groups)
  #   s = content_tag(:ul) do
  #     groups.map do |group, sub_groups|
  #       content_tag(:li, (group.title + nested_groups(sub_groups)).html_safe)
  #     end.join.html_safe
  #   end
  # end


  def custom_list_options(custom_lists)

    ret_string = "<strong>Please choose below</strong><br>"
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





end
