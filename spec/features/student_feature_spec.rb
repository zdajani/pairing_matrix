require 'rails_helper'

feature 'student can sign in and out' do
  context 'student is not logged in and on the homepage' do
    scenario 'should see and sign in link and a sign up link' do
      visit root_path
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    scenario 'should not see \'sign out\' link' do
      visit root_path
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'student logged in on the homepage' do
    before do
      visit root_path
      click_link('Sign up')
      fill_in('First name', with: 'rob')
      fill_in('Last name', with: 'stark')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('SIGN UP')
    end

    scenario 'should see \'sign out\' link' do
      visit root_path
      expect(page).to have_link('Sign out')
    end

    scenario 'should not see a \'log in\' link and a \'sign up\' link' do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
