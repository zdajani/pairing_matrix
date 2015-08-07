feature 'viewing pairings' do 
  let(:student) do
    create(:student)
  end
  
  scenario 'student generates pairings' do
    3.times{create(:student)}
    visit root_path
    login_as student
    fill_in :pairing_session, with: '1'
    click_button 'Generate pairs'
    expect(Pair.count).to eq 4
  end
  
  scenario 'pairings appear on page' do
    4.times { create(:student) }
    visit root_path
    login_as student
    fill_in :pairing_session, with: '1'
    click_button 'Generate pairs'
    Pair.all.each do |pair|
      expect(page).to have_content "#{pair.student.first_name} is paired with #{pair.assigned_pair.first_name}"
    end
  end
end 