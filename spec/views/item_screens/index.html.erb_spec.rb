require 'rails_helper'

RSpec.describe "item_screens/index", type: :view do
  before(:each) do
    assign(:item_screens, [
      ItemScreen.create!(
        item_screen_type: nil,
        restaurant: nil,
        printer: nil,
        on_new: false
      ),
      ItemScreen.create!(
        item_screen_type: nil,
        restaurant: nil,
        printer: nil,
        on_new: false
      )
    ])
  end

  it "renders a list of item_screens" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
