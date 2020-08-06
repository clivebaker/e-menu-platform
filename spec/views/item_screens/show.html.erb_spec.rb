require 'rails_helper'

RSpec.describe "item_screens/show", type: :view do
  before(:each) do
    @item_screen = assign(:item_screen, ItemScreen.create!(
      item_screen_type: nil,
      restaurant: nil,
      printer: nil,
      on_new: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
