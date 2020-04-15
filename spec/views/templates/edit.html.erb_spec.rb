require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      name: "MyString",
      key: "MyString"
    ))
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input[name=?]", "template[name]"

      assert_select "input[name=?]", "template[key]"
    end
  end
end
