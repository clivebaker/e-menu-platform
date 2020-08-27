require 'rails_helper'

RSpec.describe "raspberry_pi_statuses/new", type: :view do
  before(:each) do
    assign(:raspberry_pi_status, RaspberryPiStatus.new(
      state: "MyString"
    ))
  end

  it "renders new raspberry_pi_status form" do
    render

    assert_select "form[action=?][method=?]", raspberry_pi_statuses_path, "post" do

      assert_select "input[name=?]", "raspberry_pi_status[state]"
    end
  end
end
