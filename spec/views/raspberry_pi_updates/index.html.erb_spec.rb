require 'rails_helper'

RSpec.describe "raspberry_pi_updates/index", type: :view do
  before(:each) do
    assign(:raspberry_pi_updates, [
      RaspberryPiUpdate.create!(
        version: "Version",
        payload: "MyText"
      ),
      RaspberryPiUpdate.create!(
        version: "Version",
        payload: "MyText"
      )
    ])
  end

  it "renders a list of raspberry_pi_updates" do
    render
    assert_select "tr>td", text: "Version".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
