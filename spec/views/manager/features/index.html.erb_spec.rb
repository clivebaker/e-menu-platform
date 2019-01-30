require 'rails_helper'

RSpec.describe "manager/features/index", type: :view do
  before(:each) do
    assign(:manager_features, [
      Manager::Feature.create!(
        :name => "Name",
        :key => "Key"
      ),
      Manager::Feature.create!(
        :name => "Name",
        :key => "Key"
      )
    ])
  end

  it "renders a list of manager/features" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Key".to_s, :count => 2
  end
end
