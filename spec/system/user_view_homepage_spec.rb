require 'rails_helper'

describe 'User visits homepage' do
  it 'And sees app name' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end

  it 'And sees listed warehouses' do
    # Arrange
    Warehouse.create!(name: 'Rio', code:'SDU', city: 'Rio de Janeiro', area: 60000)
    Warehouse.create!(name: 'Maceio', code:'MCZ', city: 'Maceio', area: 50000)
    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Rio')
    expect(page).to have_content('SDU')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('60.000 m²')
    expect(page).to have_content('Maceio')
    expect(page).to have_content('MCZ')
    expect(page).to have_content('Maceio')
    expect(page).to have_content('50.000 m²')

  end
end