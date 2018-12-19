require 'rails_helper'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
Capybara.configure do |c| 
  c.run_server = false
  c.default_driver = :selenium
  c.app_host = 'http://localhost:3000'
end
options = {}
browser_name = :firefox
Capybara.register_driver :selenium do |app|
  driver_options = {browser: browser_name}.merge(options)
  Capybara::Selenium::Driver.new(app, driver_options)#browser: :firefox)
end

class RunIt
  include Capybara::DSL
  def run_root
    visit '/' 
    sleep 1
  end

  def run_images
    visit '/en/images' 
    # sleep 1
  end

  def sign_in email, password
    visit '/en/users/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Log in'   
    # sleep 1
  end

  def upload_image image_title, category_name, image_description
    visit '/en/upload'
    fill_in 'image_image_title', with: image_title
    select category_name
    fill_in 'image_image_description', with: image_description
    attach_file 'image_image', Rails.root.join('lib/pic/Animals/', 'animals.jpg') 
    click_button 'Submit'
    # sleep 1
    visit '/en/images'
    # sleep 1
  end
  
  def choose_category category_name
    visit '/'
    select category_name
    # sleep 1
  end

  def categories ids
    ids.each {|i|
      visit "en/categories/#{i}" 
    }
    # sleep 1
  end
  def add_category
    visit 'en/categories/new'
    fill_in 'category_name', with: 'test category'
    click_button 'Submit'   
    visit "en/categories/43" 
    upload_image 'test_title', 'test category', 'image_description'
    visit '/en/images'
  end
  def user_profile
   visit 'en/users/JERRY'
   click_link  'Edit'
   fill_in 'user_about', with: 'Lorem Ipsum'
   click_button 'Save changes'
   visit 'en/users/JERRY'
   click_link "Gala's category"
   visit 'en/users/JERRY'
   sleep 1
  end
end

it = RunIt.new

email = 'user3@test.com'
password = '000000'
image_title = 'New Image'
category_name = "Jerry's category"
image_description = 'Lorem Ipsum'
categories_ids = [34, 35, 39, 40, 42]


# it.run_root
# it.run_images
it.sign_in email, password
# it.upload_image image_title, category_name, image_description
# it.categories categories_ids
# it.add_category
it.user_profile