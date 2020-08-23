require 'rails_helper'

RSpec.describe "manager/opening_times/new", type: :view do
  before(:each) do
    assign(:manager_opening_time, Manager::OpeningTime.new(
      restaurant: nil,
      times: ""
    ))
  end

  it "renders new manager_opening_time form" do
    render

    assert_select "form[action=?][method=?]", manager_opening_times_path, "post" do

      assert_select "input[name=?]", "manager_opening_time[restaurant_id]"

      assert_select "input[name=?]", "manager_opening_time[times]"
    end
  end
end
