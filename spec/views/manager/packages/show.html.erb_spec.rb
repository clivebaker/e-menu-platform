require 'rails_helper'

RSpec.describe "manager/packages/show", type: :view do
  before(:each) do
    @manager_package = assign(:manager_package, Manager::Package.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
