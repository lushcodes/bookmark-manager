
feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Example')
    visit('/bookmarks')
    expect(page).to have_link('Example', href: 'http://www.example.org')

    p bookmark
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'http://www.example.com')
    fill_in('title', with: 'Example 2')
    click_button('Confirm')

    expect(page).not_to have_link('Example', href: 'http://www.example.org')
    expect(page).to have_link('Example 2', href: 'http://www.example.com')
  end
end