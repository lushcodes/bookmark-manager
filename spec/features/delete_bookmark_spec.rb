feature 'Delete a bookmark' do
  scenario 'allows user to delete a bookmark' do
    visit('/')
    click_button 'Add Bookmark'
    fill_in('url', with: 'http://www.example.org')
    fill_in('title', with: 'Test Bookmark')
    click_button('Add')
    expect(page).to have_link('Test Bookmark', href: 'http://www.example.org')

    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Example', href: 'http://www.example.org')
  end
end