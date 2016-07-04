# == Schema Information
#
# Table name: import_files
#
#  id         :integer          not null, primary key
#  file       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImportFile < ApplicationRecord
  validates :file, presence: true

  mount_uploader :file, ImportFileUploader
end
