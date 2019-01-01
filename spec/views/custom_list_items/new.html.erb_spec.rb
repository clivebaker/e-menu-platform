require 'rails_helper'

RSpec.describe "custom_list_items/new", type: :view do
  before(:each) do
    assign(:custom_list_item, CustomListItem.new(
      :name => "MyString",
      :custom_list => nil,
      :price => "9.99",
      :description => "MyText"
    ))
  end

  it "renders new custom_list_item form" do
    render

    assert_select "form[action=?][method=?]", custom_list_items_path, "post" do

      assert_select "input[name=?]", "custom_list_item[name]"

      assert_select "input[name=?]", "custom_list_item[custom_list_id]"

      assert_select "input[name=?]", "custom_list_item[price]"

      assert_select "textarea[name=?]", "custom_list_item[description]"
    end
  end
end
