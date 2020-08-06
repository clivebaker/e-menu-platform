require 'rails_helper'

RSpec.describe "item_screens/new", type: :view do
  before(:each) do
    assign(:item_screen, ItemScreen.new(
      item_screen_type: nil,
      restaurant: nil,
      printer: nil,
      on_new: false
    ))
  end

  it "renders new item_screen form" do
    render

    assert_select "form[action=?][method=?]", item_screens_path, "post" do

      assert_select "input[name=?]", "item_screen[item_screen_type_id]"

      assert_select "input[name=?]", "item_screen[restaurant_id]"

      assert_select "input[name=?]", "item_screen[printer_id]"

      assert_select "input[name=?]", "item_screen[on_new]"
    end
  end
end
