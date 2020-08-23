require 'rails_helper'

RSpec.describe "manager/opening_times/show", type: :view do
  before(:each) do
    @manager_opening_time = assign(:manager_opening_time, Manager::OpeningTime.create!(
      restaurant: nil,
      times: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
