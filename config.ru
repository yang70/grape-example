require File.expand_path( '../config/environment', __FILE__ )

if ENV[ 'RACK_ENV' ] == 'development'
  
end

run Todo::App.instance