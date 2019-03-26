module Acme
  class RescueFrom < Grape::API
    rescue_from :all do |e|
      Rack::Response.new([e.message], 500, 'Content-type' => 'text/error').finish
    end
    
    get :raise do
      raise 'Unexpected error.'
    end
  end
end