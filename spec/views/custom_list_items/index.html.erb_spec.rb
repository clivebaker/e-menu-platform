require 'rails_helper'

RSpec.describe "custom_list_items/index", type: :view do
  before(:each) do
    assign(:custom_list_items, [
      CustomListItem.create!(
        :name => "Name",
        :custom_list => nil,
        :price => "9.99",
        :description => "MyText"
      ),
      CustomListItem.create!(
        :name => "Name",
        :custom_list => nil,
        :price => "9.99",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of custom_list_items" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
