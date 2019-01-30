require 'rails_helper'

RSpec.describe "manager/packages/edit", type: :view do
  before(:each) do
    @manager_package = assign(:manager_package, Manager::Package.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit manager_package form" do
    render

    assert_select "form[action=?][method=?]", manager_package_path(@manager_package), "post" do

      assert_select "input[name=?]", "manager_package[name]"
    end
  end
end
