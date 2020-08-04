require 'rails_helper'

RSpec.describe "pi_interfaces/index", type: :view do
  before(:each) do
    assign(:pi_interfaces, [
      PiInterface.create!(
        server_token: "Server Token",
        references: ""
      ),
      PiInterface.create!(
        server_token: "Server Token",
        references: ""
      )
    ])
  end

  it "renders a list of pi_interfaces" do
    render
    assert_select "tr>td", text: "Server Token".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
