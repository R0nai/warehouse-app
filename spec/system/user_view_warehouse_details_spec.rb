require 'rails_helper'

describe 'User sees warehouse details' do

  it 'And sees additional information' do
    #Arrange
    w = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    w.save()

    #Act
    visit(root_path)
    click_on('Aeroporto SP')

    #Assert
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('Nome: Aeroporto SP')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Área: 100000 m²')
    expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000 CEP: 15000-000')

  end

  it 'And goes back to home page' do
    #Arrange
    w = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    #Act
    visit(root_path)
    click_on('Aeroporto SP')
    click_on('Voltar')

    #Assert
    expect(current_path).to eq(root_path)
  end
end