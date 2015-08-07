feature 'viewing pairings' do
  let(:student) do
    create(:student)
  end

  scenario 'student generates pairings' do
    pending
    3.times{create(:student)}
    visit root_path
    login_as student
    select 1, from: 'Date of birth'
    click_button 'Generate pairs'
    expect(Pair.count).to eq 4
  end

  scenario 'pairings appear on page' do
    pending
    3.times { create(:student) }
    visit root_path
    login_as student
    select '1', from: 'pairing_session'
    click_button 'Generate pairs'
    Pair.all.each do |pair|
      expect(page).to have_content "#{pair.student.first_name} is paired with #{pair.assigned_pair.first_name}"
    end
  end
end
