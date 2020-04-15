class Setting < ApplicationRecord
  self.table_name = 'manager_settings'


  def self.get_keys(category)
    Setting.where(category: category)
  end
  def self.get(key)
    Setting.find_by(key: key)
  end
end
