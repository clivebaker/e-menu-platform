require 'rails_helper'

RSpec.describe "receipts/edit", type: :view do
  before(:each) do
    @receipt = assign(:receipt, Receipt.create!(
      :uuid => "MyString",
      :restaurant => nil,
      :basket_total => 1,
      :items => "",
      :email => "MyString",
      :stripe_token => "MyString",
      :status => "MyString",
      :is_ready => false
    ))
  end

  it "renders the edit receipt form" do
    render

    assert_select "form[action=?][method=?]", receipt_path(@receipt), "post" do

      assert_select "input[name=?]", "receipt[uuid]"

      assert_select "input[name=?]", "receipt[restaurant_id]"

      assert_select "input[name=?]", "receipt[basket_total]"

      assert_select "input[name=?]", "receipt[items]"

      assert_select "input[name=?]", "receipt[email]"

      assert_select "input[name=?]", "receipt[stripe_token]"

      assert_select "input[name=?]", "receipt[status]"

      assert_select "input[name=?]", "receipt[is_ready]"
    end
  end
end
