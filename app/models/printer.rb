class Printer < ApplicationRecord
  belongs_to :pi_interface


  delegate :server_token, to: :pi_interface, prefix: true
end
