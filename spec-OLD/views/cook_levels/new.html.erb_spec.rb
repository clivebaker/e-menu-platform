require 'rails_helper'

RSpec.describe "cook_levels/new", type: :view do
  before(:each) do
    assign(:cook_level, CookLevel.new(
      :name => "MyString"
    ))
  end

  it "renders new cook_level form" do
    render

    assert_select "form[action=?][method=?]", cook_levels_path, "post" do

      assert_select "input[name=?]", "cook_level[name]"
    end
  end
end
