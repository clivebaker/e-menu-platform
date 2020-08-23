require 'rails_helper'

RSpec.describe "manager/opening_times/index", type: :view do
  before(:each) do
    assign(:manager_opening_times, [
      Manager::OpeningTime.create!(
        restaurant: nil,
        times: ""
      ),
      Manager::OpeningTime.create!(
        restaurant: nil,
        times: ""
      )
    ])
  end

  it "renders a list of manager/opening_times" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
