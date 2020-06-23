require 'rails_helper'

RSpec.describe "delivery_postcodes/show", type: :view do
  before(:each) do
    @delivery_postcode = assign(:delivery_postcode, DeliveryPostcode.create!(
      prefix: "Prefix",
      delivery_fee: 2,
      restaurant: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Prefix/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
