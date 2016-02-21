describe 'adding an event', :type => :feature, :js => true do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { venue.manager }
  let(:user_id) { venue.manager.id }


#   it 'shows an add event button when user has proper permissions' do
#     current_user.stub(:)
#     visit '/'
#     click_button 'register'
#     expect(page).to have_content
#   end
end
