require 'rails_helper'

describe 'User visits homepage' do
  it 'And sees app name' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end
end