class RaspberryPiUpdate < ApplicationRecord

  has_one_attached :file
  default_scope  { order(version: :desc) }


end
