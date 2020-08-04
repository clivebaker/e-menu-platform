require 'rails_helper'

RSpec.describe "manager/printers/index", type: :view do
  before(:each) do
    assign(:manager_printers, [
      Manager::Printer.create!(
        name: "Name",
        pi_interface: nil,
        vendor: "Vendor",
        product: "Product"
      ),
      Manager::Printer.create!(
        name: "Name",
        pi_interface: nil,
        vendor: "Vendor",
        product: "Product"
      )
    ])
  end

  it "renders a list of manager/printers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Vendor".to_s, count: 2
    assert_select "tr>td", text: "Product".to_s, count: 2
  end
end
