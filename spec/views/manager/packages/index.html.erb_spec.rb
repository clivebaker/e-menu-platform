require 'rails_helper'

RSpec.describe "manager/packages/index", type: :view do
  before(:each) do
    assign(:manager_packages, [
      Manager::Package.create!(
        :name => "Name"
      ),
      Manager::Package.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of manager/packages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
