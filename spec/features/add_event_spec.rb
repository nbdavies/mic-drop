describe 'adding an event', :type => :feature, :js => true do

  it 'shows an add event button when user has proper permissions' do
    visit '/'
    click_button 'register'
    expect(page).to have_content
  end
end
