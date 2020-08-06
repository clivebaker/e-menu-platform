require 'rails_helper'

RSpec.describe "item_screen_types/show", type: :view do
  before(:each) do
    @item_screen_type = assign(:item_screen_type, ItemScreenType.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
