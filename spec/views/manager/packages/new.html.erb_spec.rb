require 'rails_helper'

RSpec.describe "manager/packages/new", type: :view do
  before(:each) do
    assign(:manager_package, Manager::Package.new(
      :name => "MyString"
    ))
  end

  it "renders new manager_package form" do
    render

    assert_select "form[action=?][method=?]", manager_packages_path, "post" do

      assert_select "input[name=?]", "manager_package[name]"
    end
  end
end
