require 'rails_helper'

RSpec.describe "manager/printers/show", type: :view do
  before(:each) do
    @manager_printer = assign(:manager_printer, Manager::Printer.create!(
      name: "Name",
      pi_interface: nil,
      vendor: "Vendor",
      product: "Product"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Vendor/)
    expect(rendered).to match(/Product/)
  end
end
