require 'rails_helper'

RSpec.describe "custom_list_items/edit", type: :view do
  before(:each) do
    @custom_list_item = assign(:custom_list_item, CustomListItem.create!(
      :name => "MyString",
      :custom_list => nil,
      :price => "9.99",
      :description => "MyText"
    ))
  end

  it "renders the edit custom_list_item form" do
    render

    assert_select "form[action=?][method=?]", custom_list_item_path(@custom_list_item), "post" do

      assert_select "input[name=?]", "custom_list_item[name]"

      assert_select "input[name=?]", "custom_list_item[custom_list_id]"

      assert_select "input[name=?]", "custom_list_item[price]"

      assert_select "textarea[name=?]", "custom_list_item[description]"
    end
  end
end
