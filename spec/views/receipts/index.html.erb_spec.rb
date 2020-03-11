require 'rails_helper'

RSpec.describe "receipts/index", type: :view do
  before(:each) do
    assign(:receipts, [
      Receipt.create!(
        :uuid => "Uuid",
        :restaurant => nil,
        :basket_total => 2,
        :items => "",
        :email => "Email",
        :stripe_token => "Stripe Token",
        :status => "Status",
        :is_ready => false
      ),
      Receipt.create!(
        :uuid => "Uuid",
        :restaurant => nil,
        :basket_total => 2,
        :items => "",
        :email => "Email",
        :stripe_token => "Stripe Token",
        :status => "Status",
        :is_ready => false
      )
    ])
  end

  it "renders a list of receipts" do
    render
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Token".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
