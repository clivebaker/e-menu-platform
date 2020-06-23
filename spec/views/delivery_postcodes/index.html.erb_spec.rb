require 'rails_helper'

RSpec.describe "delivery_postcodes/index", type: :view do
  before(:each) do
    assign(:delivery_postcodes, [
      DeliveryPostcode.create!(
        prefix: "Prefix",
        delivery_fee: 2,
        restaurant: nil
      ),
      DeliveryPostcode.create!(
        prefix: "Prefix",
        delivery_fee: 2,
        restaurant: nil
      )
    ])
  end

  it "renders a list of delivery_postcodes" do
    render
    assert_select "tr>td", text: "Prefix".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
