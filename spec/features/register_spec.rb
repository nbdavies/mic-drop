describe 'registration', :type => :feature, :js => true do

  it 'reveals the registration dialog when register is clicked' do
    visit '/'
    click_button "Find out what you're doing tonight."
    click_button 'register'
    expect(page).to have_field 'username'
  end

  it 'allows me to register an account' do
    visit '/'
    click_button "Find out what you're doing tonight."
    click_button 'register'
    fill_in 'username', with: 'testuser'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'password'
    click_button 'Register'
    expect(page).to have_button 'log out'
  end

end
