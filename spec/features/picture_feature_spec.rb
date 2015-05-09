require 'rails_helper'

feature 'pictures' do
  context 'no picture have been added yet' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
    Picture.create(name: 'photo')
    # I wanted to do pic with url instead of a name at first.
    # didnt work. Need to ask Spike for advice.
    # body = [{
    #       :url => 'https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/7/000/1ef/1bf/1fab8e9.jpg' }
    #       }]
    end

    scenario 'display pictures names(for now)' do
      visit '/pictures'
      expect(page).to have_content('photo')
      # expect(page).to have_selector("img[src$='https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/7/000/1ef/1bf/1fab8e9.jpg']")
      expect(page).not_to have_content('No pictures yet!')
    end
  end

  context 'Adding pictures' do
    scenario 'asks user to attach a picture (with its name, url later), then displays it' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'photo'
      click_button 'Create Picture'
      expect(page).to have_content 'photo'
      expect(current_path).to eq '/pictures'
    end
  end
end