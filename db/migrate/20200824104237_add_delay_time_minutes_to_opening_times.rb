class AddDelayTimeMinutesToOpeningTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :opening_times, :delay_time_minutes, :integer, default: 30
    add_column :opening_times, :kitchen_delay_minutes, :integer, default: 0
  end
end
