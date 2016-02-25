describe 'logging in', :type => :feature, :js => true do

  let(:user) { FactoryGirl.create(:user) }

  it 'reveals the login dialog when login is clicked' do
    visit '/'
    click_button "Find out what you're doing tonight."
    click_button 'login'
    expect(page).to have_field 'password'
  end

  it 'allows me to login an account' do
    visit '/'
    click_button "Find out what you're doing tonight."
    click_button 'login'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Login'
    expect(page).to have_content 'LOG OUT'
  end

end
