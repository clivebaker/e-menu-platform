require 'rails_helper'

RSpec.describe "item_screen_types/index", type: :view do
  before(:each) do
    assign(:item_screen_types, [
      ItemScreenType.create!(
        name: "Name"
      ),
      ItemScreenType.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of item_screen_types" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
