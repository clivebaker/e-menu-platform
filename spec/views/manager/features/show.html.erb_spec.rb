require 'rails_helper'

RSpec.describe "manager/features/show", type: :view do
  before(:each) do
    @manager_feature = assign(:manager_feature, Manager::Feature.create!(
      :name => "Name",
      :key => "Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Key/)
  end
end
