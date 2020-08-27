require 'rails_helper'

RSpec.describe "raspberry_pi_updates/show", type: :view do
  before(:each) do
    @raspberry_pi_update = assign(:raspberry_pi_update, RaspberryPiUpdate.create!(
      version: "Version",
      payload: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/MyText/)
  end
end
