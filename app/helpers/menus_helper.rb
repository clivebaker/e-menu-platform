# frozen_string_literal: true

module MenusHelper
  # def node(menu)
  #   return_string = ''
  #   return_string << '<ul>'
  #   menu.children.each do |menu|
  #     return_string << "<li data-jstree='{\"opened\":#{menu.id == @updated_menu}, \"selected\":#{menu.id == @updated_menu}, \"icon\":\"fa fa-clone\"}' data-restaurant_id='#{menu.restaurant_id}' data-menu_id='#{menu.id}' data-node_type='#{menu.node_type}' data-parent='#{menu.id}'>#{menu.name}"
  #     return_string << node(menu) if menu.has_children?
  #     return_string << ' </li>'
  #   end
  #   return_string << '</ul>'
  # end
end
