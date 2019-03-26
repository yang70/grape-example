module Todo
  
  # DB = Sequel.connect( 
  #   'postgres://bedrocket:password@localhost:5432/grape_todo', 
  #   logger: Logger.new( STDOUT ) 
  # )
  
  class App
    def initialize
      @rack_static = ::Rack::Static.new(
        lambda { [ 404, {}, [] ] },
        root: File.expand_path( '../../public', __FILE__ ),
        url: [ '/' ]
      )
    end
    
    def self.instance
      @instance ||= Rack::Builder.new do
        
        use Rack::Cors do
          allow do
            origins '*'
            resource '*', headers: :any, methods: :get
          end
        end
        
        run Todo::App.new
      end.to_app
    end
    
    def call( env )
      response = Todo::API.call( env )
      
      case response[0]
      when 404, 500
        # #TODO
        # content = @rack_static.call( 
        #   env.merge('PATH_INFO' => "/errors/#{response[0]}.html")
        # )
        # 
        # [ response[ 0 ], content[ 1 ], content[ 2 ] ]
      else
        response
      end
    end
  end
end
