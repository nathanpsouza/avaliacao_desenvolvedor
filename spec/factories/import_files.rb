FactoryGirl.define do
  factory :import_file do
    file { Rack::Test::UploadedFile.new(
      File.open( File.join(Rails.root, 'spec', 'support', 'order', 'dados.txt') ) 
    ) }

    factory :invalid_import_file do
      file { Rack::Test::UploadedFile.new(
      File.open( File.join(Rails.root, 'spec', 'support', 'order', 'invalid.txt') ) 
    ) }
    end
  end
end
