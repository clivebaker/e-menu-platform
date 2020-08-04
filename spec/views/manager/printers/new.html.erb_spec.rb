require 'rails_helper'

RSpec.describe "manager/printers/new", type: :view do
  before(:each) do
    assign(:manager_printer, Manager::Printer.new(
      name: "MyString",
      pi_interface: nil,
      vendor: "MyString",
      product: "MyString"
    ))
  end

  it "renders new manager_printer form" do
    render

    assert_select "form[action=?][method=?]", manager_printers_path, "post" do

      assert_select "input[name=?]", "manager_printer[name]"

      assert_select "input[name=?]", "manager_printer[pi_interface_id]"

      assert_select "input[name=?]", "manager_printer[vendor]"

      assert_select "input[name=?]", "manager_printer[product]"
    end
  end
end
