require 'rails_helper'

RSpec.describe "manager/printers/edit", type: :view do
  before(:each) do
    @manager_printer = assign(:manager_printer, Manager::Printer.create!(
      name: "MyString",
      pi_interface: nil,
      vendor: "MyString",
      product: "MyString"
    ))
  end

  it "renders the edit manager_printer form" do
    render

    assert_select "form[action=?][method=?]", manager_printer_path(@manager_printer), "post" do

      assert_select "input[name=?]", "manager_printer[name]"

      assert_select "input[name=?]", "manager_printer[pi_interface_id]"

      assert_select "input[name=?]", "manager_printer[vendor]"

      assert_select "input[name=?]", "manager_printer[product]"
    end
  end
end
