require 'rails_helper'

RSpec.describe "delivery_postcodes/edit", type: :view do
  before(:each) do
    @delivery_postcode = assign(:delivery_postcode, DeliveryPostcode.create!(
      prefix: "MyString",
      delivery_fee: 1,
      restaurant: nil
    ))
  end

  it "renders the edit delivery_postcode form" do
    render

    assert_select "form[action=?][method=?]", delivery_postcode_path(@delivery_postcode), "post" do

      assert_select "input[name=?]", "delivery_postcode[prefix]"

      assert_select "input[name=?]", "delivery_postcode[delivery_fee]"

      assert_select "input[name=?]", "delivery_postcode[restaurant_id]"
    end
  end
end
