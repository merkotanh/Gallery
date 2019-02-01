namespace :imsize do
  task im: :environment do
  Image.find_each do |image|
    image.image.recreate_versions!
  end
  end
end
