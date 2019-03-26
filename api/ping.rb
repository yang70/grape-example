module Todo
  class Ping < Grape::API
    format :json
    
    get '/lists' do
      # res = DB[ :lists ]
        
      { ping: 'pong' }
    end
  end
end