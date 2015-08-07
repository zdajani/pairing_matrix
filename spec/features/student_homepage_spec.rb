feature "student homepage" do
  let(:student1) do
    create(:student)
  end
  
  before do
    3.times { create(:student) }
    visit root_path
    login_as student1
    fill_in :pairing_session, with: '1'
    click_button 'Generate pairs'
    click_link 'Sign out' 
  end
  scenario "going to an individual homepage" do
    visit root_path
    click_link 'Log in'
    
    fill_in 'Email', with: student1.email
    fill_in 'Password', with: student1.password 
    click_button('LOG IN')
    expect(current_path).to eq student_path(student1.id)
  end
  
  scenario "past pairings appear on page" do
    login_as student1
    visit student_path(student1.id)
    expect(page).to have_content("Pair History")
    expect(page).to have_content("CatNumber6 Foo")
  end
end