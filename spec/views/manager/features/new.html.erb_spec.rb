require 'rails_helper'

RSpec.describe "manager/features/new", type: :view do
  before(:each) do
    assign(:manager_feature, Manager::Feature.new(
      :name => "MyString",
      :key => "MyString"
    ))
  end

  it "renders new manager_feature form" do
    render

    assert_select "form[action=?][method=?]", manager_features_path, "post" do

      assert_select "input[name=?]", "manager_feature[name]"

      assert_select "input[name=?]", "manager_feature[key]"
    end
  end
end
