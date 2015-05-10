require 'rails_helper'

feature 'writing comments' do
  before { Picture.create name: 'photo' }

  scenario 'allows users to write comments on pictures' do
    visit '/pictures'
    click_link 'Add a comment'
    fill_in 'Thoughts', with: 'whatever'
    click_button 'Leave Comment'
    expect(page).to have_content 'whatever'
    expect(current_path).to eq '/pictures'
  end
end
