require 'rails_helper'

RSpec.describe "raspberry_pi_updates/new", type: :view do
  before(:each) do
    assign(:raspberry_pi_update, RaspberryPiUpdate.new(
      version: "MyString",
      payload: "MyText"
    ))
  end

  it "renders new raspberry_pi_update form" do
    render

    assert_select "form[action=?][method=?]", raspberry_pi_updates_path, "post" do

      assert_select "input[name=?]", "raspberry_pi_update[version]"

      assert_select "textarea[name=?]", "raspberry_pi_update[payload]"
    end
  end
end
