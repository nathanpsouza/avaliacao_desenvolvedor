# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  customer_name  :string           not null
#  description    :string           not null
#  value          :decimal(8, 2)    not null
#  quantity       :integer          not null
#  address        :string
#  provider       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  import_file_id :integer
#

class Order < ApplicationRecord
  validates :customer_name, presence: true
  validates :description, presence: true
  validates :value, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates :import_file, presence: true

  belongs_to :import_file
end
