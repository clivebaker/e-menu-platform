require 'rails_helper'

RSpec.describe "manager/settings/index", type: :view do
  before(:each) do
    assign(:manager_settings, [
      Manager::Setting.create!(
        :name => "Name",
        :key => "Key",
        :category => "Category"
      ),
      Manager::Setting.create!(
        :name => "Name",
        :key => "Key",
        :category => "Category"
      )
    ])
  end

  it "renders a list of manager/settings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
