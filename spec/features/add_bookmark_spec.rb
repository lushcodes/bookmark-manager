feature 'Add a bookmark' do

  scenario 'allows user to add bookmark' do
    visit('/')
    click_button 'Add Bookmark'
    fill_in('url', with: 'http://www.example.org')
    fill_in('title', with: 'Test Bookmark')
    click_button('Add')
    expect(page).to have_link('Test Bookmark', href: 'http://www.example.org')
  end
end