require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  describe 'home#index' do
    before (:each) do
      visit root_path
    end

    it 'should show the home page' do
      expect(page).to have_current_path root_path
    end

    it 'should show the sign up' do
      first(:link_or_button, 'Sign up').click
      expect(page).to have_current_path new_user_registration_path
    end
  end
end