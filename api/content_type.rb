module Todo
  class ContentType < Grape::API
    format :json
    
    get 'mixed' do
      { data: 'Hello world' }
    end
  end
end