require 'rails_helper'

RSpec.describe "manager/settings/edit", type: :view do
  before(:each) do
    @manager_setting = assign(:manager_setting, Manager::Setting.create!(
      :name => "MyString",
      :key => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit manager_setting form" do
    render

    assert_select "form[action=?][method=?]", manager_setting_path(@manager_setting), "post" do

      assert_select "input[name=?]", "manager_setting[name]"

      assert_select "input[name=?]", "manager_setting[key]"

      assert_select "input[name=?]", "manager_setting[category]"
    end
  end
end
