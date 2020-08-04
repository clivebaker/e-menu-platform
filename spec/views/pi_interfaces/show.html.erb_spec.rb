require 'rails_helper'

RSpec.describe "pi_interfaces/show", type: :view do
  before(:each) do
    @pi_interface = assign(:pi_interface, PiInterface.create!(
      server_token: "Server Token",
      references: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Server Token/)
    expect(rendered).to match(//)
  end
end
