feature 'Viewing Bookmarks' do
  scenario 'is able to view a list of bookmarks' do
    visit('/')
    click_button 'View Bookmarks'
    expect(page).to have_content 'http://www.reddit.com'
  end
end