describe 'registration', :type => :feature, :js => true do
  it 'reveals the registration dialog when register is clicked' do
    visit '/'
    click_button 'register'
    expect(page).to have_content
  end
end
