require 'rails_helper'

RSpec.describe "custom_lists/show", type: :view do
  before(:each) do
    @custom_list = assign(:custom_list, CustomList.create!(
      :name => "Name",
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
