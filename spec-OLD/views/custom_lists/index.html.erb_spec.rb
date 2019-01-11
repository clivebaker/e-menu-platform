require 'rails_helper'

RSpec.describe "custom_lists/index", type: :view do
  before(:each) do
    assign(:custom_lists, [
      CustomList.create!(
        :name => "Name",
        :restaurant => nil
      ),
      CustomList.create!(
        :name => "Name",
        :restaurant => nil
      )
    ])
  end

  it "renders a list of custom_lists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
