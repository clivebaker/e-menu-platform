require 'rails_helper'

RSpec.describe "custom_list_items/show", type: :view do
  before(:each) do
    @custom_list_item = assign(:custom_list_item, CustomListItem.create!(
      :name => "Name",
      :custom_list => nil,
      :price => "9.99",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
