require 'rails_helper'

feature 'writing comments' do
  before { Picture.create name: 'photo' }
  before do
    signing_up_and_in
  end

  xscenario 'allows users to write comments on pictures' do
    visit '/pictures'
    click_link 'Add a comment'
    fill_in 'Thoughts', with: 'whatever'
    click_button 'Leave Comment'
    expect(page).to have_content 'whatever'
    expect(current_path).to eq '/pictures'
  end
end

feature 'once a comment has been added' do
  before { Picture.create name: 'photo' }
  before do
    signing_up_and_in
    leaving_a_comment
  end

  xscenario 'allows users to edit a comment' do
    click_link 'Edit Comment'
    fill_in 'Thoughts', with: 'this is new'
    click_button 'Leave Comment'
    expect(page).not_to have_content 'whatever'
    expect(page).to have_content 'this is new'
  end

  xscenario 'allows users to delete a comment' do
    click_link 'Delete Comment'
    expect(page).not_to have_content 'whatever'
  end
end
