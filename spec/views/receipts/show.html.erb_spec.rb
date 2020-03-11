require 'rails_helper'

RSpec.describe "receipts/show", type: :view do
  before(:each) do
    @receipt = assign(:receipt, Receipt.create!(
      :uuid => "Uuid",
      :restaurant => nil,
      :basket_total => 2,
      :items => "",
      :email => "Email",
      :stripe_token => "Stripe Token",
      :status => "Status",
      :is_ready => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Stripe Token/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/false/)
  end
end
