require 'rails_helper'

RSpec.describe "pi_interfaces/new", type: :view do
  before(:each) do
    assign(:pi_interface, PiInterface.new(
      server_token: "MyString",
      references: ""
    ))
  end

  it "renders new pi_interface form" do
    render

    assert_select "form[action=?][method=?]", pi_interfaces_path, "post" do

      assert_select "input[name=?]", "pi_interface[server_token]"

      assert_select "input[name=?]", "pi_interface[references]"
    end
  end
end
