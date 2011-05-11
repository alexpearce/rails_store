# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Store::Application.initialize!

if $0 == 'script/rails'
  Hirb.enable
end