require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:customer_name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity) }
    it { is_expected.to validate_presence_of(:import_file) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:import_file).counter_cache(:order_count) }
  end
end
