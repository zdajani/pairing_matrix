feature 'viewing pairings' do
  let(:student) do
    create(:student)
  end

  scenario 'student generates pairings' do
    3.times{create(:student)}
    visit root_path
    login_as student
    find("option[value='1']").click
    click_button 'Generate pairs'
    expect(Pair.count).to eq 4
  end

  scenario 'pairings appear on page' do
    3.times { create(:student) }
    visit root_path
    login_as student
    find("option[value='1']").click
    click_button 'Generate pairs'
    Student.all.each_with_index do |student, i|
      if i%2 == 0
        expect(page).to have_content "#{student.first_name} is paired with #{(Student.find(student.current_pair)).first_name}"
      end
    end
  end
end
