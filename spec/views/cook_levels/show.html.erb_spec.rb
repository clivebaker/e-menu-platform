require 'rails_helper'

RSpec.describe "cook_levels/show", type: :view do
  before(:each) do
    @cook_level = assign(:cook_level, CookLevel.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
