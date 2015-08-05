require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_field("name")
  end

  scenario 'When I enter my name, I am taken to the game page' do
    visit '/new_game'
    fill_in('name', with: 'whateva')
    click_button('Submit')
    expect(page).to have_content("Let the games begin!")
  end

  scenario 'When I enter my name, I am taken to the game page' do
    visit '/new_game'
    click_button('Submit')
    expect(page).to have_content("You need a name!")
  end

end
