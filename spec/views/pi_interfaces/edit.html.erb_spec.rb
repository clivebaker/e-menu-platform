require 'rails_helper'

RSpec.describe "pi_interfaces/edit", type: :view do
  before(:each) do
    @pi_interface = assign(:pi_interface, PiInterface.create!(
      server_token: "MyString",
      references: ""
    ))
  end

  it "renders the edit pi_interface form" do
    render

    assert_select "form[action=?][method=?]", pi_interface_path(@pi_interface), "post" do

      assert_select "input[name=?]", "pi_interface[server_token]"

      assert_select "input[name=?]", "pi_interface[references]"
    end
  end
end
