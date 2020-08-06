require 'rails_helper'

RSpec.describe "item_screens/edit", type: :view do
  before(:each) do
    @item_screen = assign(:item_screen, ItemScreen.create!(
      item_screen_type: nil,
      restaurant: nil,
      printer: nil,
      on_new: false
    ))
  end

  it "renders the edit item_screen form" do
    render

    assert_select "form[action=?][method=?]", item_screen_path(@item_screen), "post" do

      assert_select "input[name=?]", "item_screen[item_screen_type_id]"

      assert_select "input[name=?]", "item_screen[restaurant_id]"

      assert_select "input[name=?]", "item_screen[printer_id]"

      assert_select "input[name=?]", "item_screen[on_new]"
    end
  end
end
