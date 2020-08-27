require 'rails_helper'

RSpec.describe "raspberry_pi_statuses/index", type: :view do
  before(:each) do
    assign(:raspberry_pi_statuses, [
      RaspberryPiStatus.create!(
        state: "State"
      ),
      RaspberryPiStatus.create!(
        state: "State"
      )
    ])
  end

  it "renders a list of raspberry_pi_statuses" do
    render
    assert_select "tr>td", text: "State".to_s, count: 2
  end
end
