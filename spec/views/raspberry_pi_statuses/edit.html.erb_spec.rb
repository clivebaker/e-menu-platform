require 'rails_helper'

RSpec.describe "raspberry_pi_statuses/edit", type: :view do
  before(:each) do
    @raspberry_pi_status = assign(:raspberry_pi_status, RaspberryPiStatus.create!(
      state: "MyString"
    ))
  end

  it "renders the edit raspberry_pi_status form" do
    render

    assert_select "form[action=?][method=?]", raspberry_pi_status_path(@raspberry_pi_status), "post" do

      assert_select "input[name=?]", "raspberry_pi_status[state]"
    end
  end
end
