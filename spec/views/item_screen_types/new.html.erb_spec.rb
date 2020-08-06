require 'rails_helper'

RSpec.describe "item_screen_types/new", type: :view do
  before(:each) do
    assign(:item_screen_type, ItemScreenType.new(
      name: "MyString"
    ))
  end

  it "renders new item_screen_type form" do
    render

    assert_select "form[action=?][method=?]", item_screen_types_path, "post" do

      assert_select "input[name=?]", "item_screen_type[name]"
    end
  end
end
