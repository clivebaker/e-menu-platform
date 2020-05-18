require 'rubygems'
require 'yaml'
require 'json'


namespace :orphan_list_items do

	desc "Importing Base Data - Restaurant"
  task menu: :environment do

    Menu.all.each do |menu|
    
      if menu.custom_lists.present?
     
        keys = menu.custom_lists.keys
        keys.each do |key|
          list_error = false
          begin
           cl = CustomList.find(key)
          rescue ActiveRecord::RecordNotFound => e
            puts e

            menu.custom_lists.delete(key)
            menu.save
            list_error = true
          end

          unless list_error
            list_items =  menu.custom_lists[key]
            list_items.each do |item|
              begin
              cli = CustomListItem.find(item)
              rescue ActiveRecord::RecordNotFound => e

                puts menu.id, e

                menu.custom_lists[key] -= [item]
                menu.save
              end

            end
          end

        end


    
      end

    end



  end




end

