class Patron < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :redirect_after_signup_to

  has_and_belongs_to_many :orders
  has_many :patron_allergens
  has_many :patron_addresses
  has_one :patron_marketing_preference

  after_create :create_associations

  default_scope { includes(:orders) }

  def get_order_history
    orders
  end

  private

  def create_associations
    self.create_patron_marketing_preference
  end
end
