require 'rails_helper'

RSpec.describe Language, type: :model do
	let(:language) { create(:language) }
  it "has a valid factory" do
  	#puts :language.inspect
    expect(language).to be_valid
  end
	
	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:locale) }
	it { is_expected.to validate_presence_of(:icon) }
	it { is_expected.to validate_presence_of(:language_code) }

end