class AddDelayTimeMinutesToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :delay_time_minutes, :integer
  end
end
