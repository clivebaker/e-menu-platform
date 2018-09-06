class AddTranslationTable < ActiveRecord::Migration[5.2]
  def change


    reversible do |dir|
      dir.up do
	      I18n.with_locale(:en) do
	        Menu.create_translation_table!({ 
	        	:name => :string, 
	        	:description => :text },
					{
	      		:migrate_data => true,
	      		:remove_source_columns => true
	    		})
	  	end    
     end

      dir.down do
        Menu.drop_translation_table!
      end
    end



  end
end
