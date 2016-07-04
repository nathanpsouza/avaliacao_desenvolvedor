require 'rails_helper'
feature 'import orders from file' do 

  let(:valid) { File.join(Rails.root, 'spec', 'support', 'order', 'dados.txt') }
  let(:invalid) { File.join(Rails.root, 'spec', 'support', 'order', 'invalid.txt') }

  scenario 'upload file' do
    visit root_path

    click_button 'Importar pedidos'

    attach_file('Arquivo', valid)

    click_button 'Importar'
    
    ["João Silva", "Amy Pond", "Marty McFly", "Snake Plissken"].each do |product|
      expect(page).to have_content(product)
    end
  end

  scenario 'see error message when file is not valid' do
    visit root_path

    click_button 'Importar pedidos'

    attach_file('Arquivo', invalid)

    click_button 'Importar'
    
    expect(page).to have_content('Arquivo em formato inválido')
  end
end