# Path for library I18n to seek our tгanslations
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]

# White list of locales
I18n.available_locales = [:en, :ru]

# Default locale
I18n.default_locale = :en