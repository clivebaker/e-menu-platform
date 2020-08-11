class Printer < ApplicationRecord
  belongs_to :pi_interface
  has_many :item_screens


  delegate :server_token, to: :pi_interface, prefix: true
end
