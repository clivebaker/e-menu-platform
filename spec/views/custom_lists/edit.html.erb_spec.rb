require 'rails_helper'

RSpec.describe "custom_lists/edit", type: :view do
  before(:each) do
    @custom_list = assign(:custom_list, CustomList.create!(
      :name => "MyString",
      :restaurant => nil
    ))
  end

  it "renders the edit custom_list form" do
    render

    assert_select "form[action=?][method=?]", custom_list_path(@custom_list), "post" do

      assert_select "input[name=?]", "custom_list[name]"

      assert_select "input[name=?]", "custom_list[restaurant_id]"
    end
  end
end
