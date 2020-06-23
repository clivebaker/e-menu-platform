require 'rails_helper'

RSpec.describe "delivery_postcodes/new", type: :view do
  before(:each) do
    assign(:delivery_postcode, DeliveryPostcode.new(
      prefix: "MyString",
      delivery_fee: 1,
      restaurant: nil
    ))
  end

  it "renders new delivery_postcode form" do
    render

    assert_select "form[action=?][method=?]", delivery_postcodes_path, "post" do

      assert_select "input[name=?]", "delivery_postcode[prefix]"

      assert_select "input[name=?]", "delivery_postcode[delivery_fee]"

      assert_select "input[name=?]", "delivery_postcode[restaurant_id]"
    end
  end
end
