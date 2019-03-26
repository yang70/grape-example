module Todo
  class API < Grape::API
    format :json
    mount ::Todo::Ping
  end
end