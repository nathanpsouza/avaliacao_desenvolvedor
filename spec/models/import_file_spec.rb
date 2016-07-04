require 'rails_helper'

RSpec.describe ImportFile, type: :model do
  context 'validations' do 
    it { is_expected.to validate_presence_of(:file) }
  end

  context 'relations' do
    it { is_expected.to have_many :orders }
  end

  describe '#total' do
    it 'return the sum of order values' do
      import_file = FactoryGirl.create(:import_file)
      orders = FactoryGirl.create_list(:order, 3, import_file: import_file)

      expect(import_file.total).to eq(orders.pluck(:value).sum)
    end
  end
end
