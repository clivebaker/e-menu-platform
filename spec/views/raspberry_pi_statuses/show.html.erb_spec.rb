require 'rails_helper'

RSpec.describe "raspberry_pi_statuses/show", type: :view do
  before(:each) do
    @raspberry_pi_status = assign(:raspberry_pi_status, RaspberryPiStatus.create!(
      state: "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/State/)
  end
end
