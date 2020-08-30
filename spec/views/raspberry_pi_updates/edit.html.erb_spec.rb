require 'rails_helper'

RSpec.describe "raspberry_pi_updates/edit", type: :view do
  before(:each) do
    @raspberry_pi_update = assign(:raspberry_pi_update, RaspberryPiUpdate.create!(
      version: "MyString",
      payload: "MyText"
    ))
  end

  it "renders the edit raspberry_pi_update form" do
    render

    assert_select "form[action=?][method=?]", raspberry_pi_update_path(@raspberry_pi_update), "post" do

      assert_select "input[name=?]", "raspberry_pi_update[version]"

      assert_select "textarea[name=?]", "raspberry_pi_update[payload]"
    end
  end
end
