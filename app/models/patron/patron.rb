class Patron < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :redirect_after_signup_to

  has_and_belongs_to_many :orders

  default_scope { includes(:orders) }

  def get_order_history
    orders
  end
end
