require 'rails_helper'

RSpec.describe "custom_lists/new", type: :view do
  before(:each) do
    assign(:custom_list, CustomList.new(
      :name => "MyString",
      :restaurant => nil
    ))
  end

  it "renders new custom_list form" do
    render

    assert_select "form[action=?][method=?]", custom_lists_path, "post" do

      assert_select "input[name=?]", "custom_list[name]"

      assert_select "input[name=?]", "custom_list[restaurant_id]"
    end
  end
end
