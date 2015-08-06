require 'rails_helper'

feature 'student can sign in and out' do
  context 'student is not logged in and on the homepage' do
    scenario 'should see and sign in link and a sign up link' do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    scenario 'should not see \'sign out\' link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'student logged in on the homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('First name', with: 'rob')
      fill_in('Last name', with: 'stark')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('SIGN UP')
    end

    scenario 'should see \'sign out\' link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario 'should not see a \'log in\' link and a \'sign up\' link' do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

feature 'students can see a cohort list' do

  # let!(:student) do
  #   create(:student)
  # end

  before do
    visit('/')
    click_link('Sign up')
    fill_in('First name', with: 'rob')
    fill_in('Last name', with: 'stark')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('SIGN UP')
  end

  scenario 'should see a cohort list when logged in' do
    visit '/students/1'
    expect(page).to have_content('Cohort List')
    expect(page).to have_content("rob stark")
  end

  scenario 'should see a dropdown with a list of days' do
    visit '/students/1'
    expect(page).to have_content('')
    expect(page).to have_css 'select', text: 'Day 1'
  end

end
