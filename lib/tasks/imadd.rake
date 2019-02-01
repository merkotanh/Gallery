namespace :app do
  task imadd: :environment do
    dir = "#{Rails.root}/lib/pic"
    dirs = Dir.entries(dir).reject {|f| f[0].include?('.')}
    user = User.find_by id: 13

    dirs.each do |f|
      ctg = Category.create(name:f, user_id:user.id)
      files = Dir.entries(dir+'/'+f).reject {|file| file[0].include?('.')}
      files.each do |filename|
        # %w(jpg jpeg gif png) 
          img = File.open(dir+'/'+f+'/'+filename)
          p dir+'/'+f+'/'+filename
          Image.create(image:img, image_title:filename, image_file_size:"10", image_description:"", category_id:ctg.id)
          p "OK!"
      end
    end
  end
end
