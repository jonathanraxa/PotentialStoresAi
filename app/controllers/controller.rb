# application_controller.rb
class ApplicationController < Sinatra::Base
  configure do
    set :views, "app/views"
    set :public_dir, "public"
    register Sinatra::Reloader 

  end

# example: localhost:3000/state/stats?store_req_pop=10000&state_name=wyoming

    set :root, 'controller'

    get '/' do 
        erb :index, locals: {store_req_pop: nil, state_name: nil, ciphered: nil}
    end
    
    get '/state/' do 
        erb :index, locals: {store_req_pop: nil, state_name: nil, ciphered: nil}
    end

    # pulls the params form URL
    get '/state/stats' do 
      @store_req_pop = params['store_req_pop']
      @state_name    = params['state_name']
      data = PopulationCalc.new(@state_name, @store_req_pop)
      data.get_store_support_count
      erb :index, locals: {store_req_pop: @store_req_pop, state_name: @state_name}
    end

    # sets new params
    post '/state/stats/:store_req_pop/:state_name' do
      @store_req_pop = params['store_req_pop']
      @state_name    = params['state_name']
      data = PopulationCalc.new(@state_name, @store_req_pop)
      data.get_store_support_count
      erb :index, locals: {store_req_pop: @store_req_pop, state_name: @state_name}
    end
end