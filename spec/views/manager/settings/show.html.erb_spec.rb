require 'rails_helper'

RSpec.describe "manager/settings/show", type: :view do
  before(:each) do
    @manager_setting = assign(:manager_setting, Manager::Setting.create!(
      :name => "Name",
      :key => "Key",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/Category/)
  end
end
