# frozen_string_literal: true

# features/items_spec.rb

require 'spec_helper'

describe 'homepage' do
  describe 'homepage when signed in', type: :feature do
    before(:each) do
      DatabaseCleaner.clean
      signin_user
    end

    describe 'GET /' do
      it 'can GET /' do
        visit asset_groups_path
        page.status_code.should == 200
        expect(page).to have_content 'My items'
        expect(page).to have_content 'Other stuff'
      end
    end
  end
end
