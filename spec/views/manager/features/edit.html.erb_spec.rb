require 'rails_helper'

RSpec.describe "manager/features/edit", type: :view do
  before(:each) do
    @manager_feature = assign(:manager_feature, Manager::Feature.create!(
      :name => "MyString",
      :key => "MyString"
    ))
  end

  it "renders the edit manager_feature form" do
    render

    assert_select "form[action=?][method=?]", manager_feature_path(@manager_feature), "post" do

      assert_select "input[name=?]", "manager_feature[name]"

      assert_select "input[name=?]", "manager_feature[key]"
    end
  end
end
