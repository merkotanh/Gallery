<h3>Simple gallery</h3>

ruby 2.3+, rails 5+, postgresql, github

Bootstrap user interface framework (https://github.com/twbs/bootstrap-sass)<br />
Haml template engine (https://github.com/indirect/haml-rails)<br />
Carrierwave downloads (https://github.com/carrierwaveuploader/carrierwave)<br />
Device authentication (https://github.com/plataformatec/devise)<br />
Admin panel ActiveAdmin (https://github.com/activeadmin/activeadmin)<br />
Kaminari pagination (https://github.com/kaminari/kaminari)<br />
Human-readable URL's (https://github.com/norman/friendly_id)<br />
Dynamic grid layout plugin Masonry (https://github.com/kristianmandrup/masonry-rails)<br />
Google reCaptcha (https://github.com/ambethia/recaptcha)<br />
OmniAuth strategy for authenticating to GitHub, Facebook, Google<br />
 (https://github.com/mkdynamic/omniauth-facebook)<br />
 (https://github.com/omniauth/omniauth-oauth2)<br />
 (https://github.com/zquestz/omniauth-google-oauth2)<br />
 (https://github.com/omniauth/omniauth-github)<br />
Background jobs with gem resque (https://github.com/resque/resque)<br />
HTML, XML, SAX, and Reader parser (https://github.com/sparklemotion/nokogiri)<br />
Rspec test framework (https://github.com/rspec/rspec-rails)<br />

<h4>User functionality</h4>

<h5>User may:</h5>
 - Register and login.
 - Login via Facbook, Google, GitHub.
 - Recover forgotten password.
 - Create new categories.
 - Upload new images.
 - Delete his categories. (When deleting the category, all its images and image comments should be deleted.)
 - Rename his categories or images.
 - Delete images he has uploaded. (Not uploaded by another user.)
 - Like the pictures (one picture - one like, without reloading page). Like the image again will take like back. (as in vk.com)
 - Leave comments to pictures (one picture - a lot of comments, displayed next to each picture)
 - Edit your data: password, name, email, profile picture.
 - Subscribe and unsubscribe to / from another user.
 - Receive email when smth ve been changed in category of user he has subscribed to.
 - Watch anothers' profiles.
 - Watch pictures he has been subscribed to and has uploaded on his profile page.

<h4>Admin panel</h4>
 The admin panel is accessible via admin path. An admin user is created separately, which is not related to user functionality. The main page (dashboard) should display:
 - 15 recently created categories,
 - 15 recent comments,
 - 15 last uploaded images,
 - actions of all users - users' activities.

<h5>Admin may:</h5>
 - Create, edit, delete all application resources. (Categories, images, comments, etc.)
 - Create and delete new administrators.
 - Parse images using nokogiri /admin/ng page.


<h4>General</h4>
 - The picture should receive 3 copies: 
   Full size - used on / image / show
   Curbstone average - used as a preview on categories / index
   The thumbnail is used in the admin panel and on user avatars
 - Ability to switch language (Eglish/Russian).
 - Use friendly_id to form human-readable URL's.
 - Menu (horizontal, toggable).
 - Categories (it’s also a vertical menu or a drop-down list) - displays the 5 most popular categories. Popular categories are those with the most likes.
 - images on index page sorted by descending with infinite scrolling. Link to images leads to show image page.
 - All comments (sorted by creation date)
