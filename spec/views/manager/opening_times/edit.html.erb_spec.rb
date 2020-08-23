require 'rails_helper'

RSpec.describe "manager/opening_times/edit", type: :view do
  before(:each) do
    @manager_opening_time = assign(:manager_opening_time, Manager::OpeningTime.create!(
      restaurant: nil,
      times: ""
    ))
  end

  it "renders the edit manager_opening_time form" do
    render

    assert_select "form[action=?][method=?]", manager_opening_time_path(@manager_opening_time), "post" do

      assert_select "input[name=?]", "manager_opening_time[restaurant_id]"

      assert_select "input[name=?]", "manager_opening_time[times]"
    end
  end
end
