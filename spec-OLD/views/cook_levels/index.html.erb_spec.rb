require 'rails_helper'

RSpec.describe "cook_levels/index", type: :view do
  before(:each) do
    assign(:cook_levels, [
      CookLevel.create!(
        :name => "Name"
      ),
      CookLevel.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of cook_levels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
