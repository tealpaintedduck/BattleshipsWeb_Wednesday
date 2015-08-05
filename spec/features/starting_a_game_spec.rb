require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_field("name")
  end

  scenario 'When I enter my name, I am taken to the set_up page' do
    visit '/new_game'
    fill_in('name', with: 'whateva')
    click_button('Submit')
    expect(page).to have_content("Let the games begin!")
  end

  scenario 'When I fail to enter my name, I am taken back to the new_game page' do
    visit '/new_game'
    click_button('Submit')
    expect(page).to have_content("You need a name!")
  end

  scenario 'When I start a game, I am asked to place ships' do
    visit '/new_game'
    fill_in('name', with: 'whateva')
    click_button('Submit')
    expect(page).to have_content("Please place your ships.")
  end

  scenario 'Once I\'ve entered my ship placements, I am taken to the game_page' do
    visit '/new_game'
    fill_in('name', with: 'whateva')
    click_button('Submit')
    # ship placement form
    fill_in('destroyer_coordinate', with: :B1)
    fill_in('battleship_coordinate', with: :C1)
    fill_in('submarine_coordinate', with: :E1)
    fill_in('cruiser_coordinate', with: :D1)
    fill_in('aircraft_carrier_coordinate', with: :F1)
    click_button('Submit')
    expect(page).to have_content("Here's your board!")
  end

end
