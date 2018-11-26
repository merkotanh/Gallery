ActiveAdmin.register_page "ng" do
  require 'open-uri'
  require 'nokogiri'
  
  content do
    render 'ng/form'
  end

  page_action :import, method: :post do
    @images = Nokogiri::HTML(open(params[:ng][:url])).search('img')
    render 'ng/show'
  end

end