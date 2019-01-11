require 'rails_helper'

RSpec.describe "cook_levels/edit", type: :view do
  before(:each) do
    @cook_level = assign(:cook_level, CookLevel.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit cook_level form" do
    render

    assert_select "form[action=?][method=?]", cook_level_path(@cook_level), "post" do

      assert_select "input[name=?]", "cook_level[name]"
    end
  end
end
