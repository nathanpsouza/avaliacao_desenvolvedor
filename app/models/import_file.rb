# == Schema Information
#
# Table name: import_files
#
#  id          :integer          not null, primary key
#  file        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_count :integer          default(0)
#

class ImportFile < ApplicationRecord
  validates :file, presence: true

  mount_uploader :file, ::ImportFileUploader

  has_many :orders

  def total
    orders.pluck(:value).sum
  end
end
