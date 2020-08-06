require 'rails_helper'

RSpec.describe "item_screen_types/edit", type: :view do
  before(:each) do
    @item_screen_type = assign(:item_screen_type, ItemScreenType.create!(
      name: "MyString"
    ))
  end

  it "renders the edit item_screen_type form" do
    render

    assert_select "form[action=?][method=?]", item_screen_type_path(@item_screen_type), "post" do

      assert_select "input[name=?]", "item_screen_type[name]"
    end
  end
end
