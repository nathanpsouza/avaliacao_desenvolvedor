require 'rails_helper'

RSpec.describe ImportFile, type: :model do
  context 'validations' do 
    it { is_expected.to validate_presence_of(:file) }
  end

  context 'relations' do
    it { is_expected.to have_many :orders }
  end
end
