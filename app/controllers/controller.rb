# application_controller.rb

require "sinatra/base"
require "sinatra/reloader"

class ApplicationController < Sinatra::Base
  
  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  # development only
  configure :development do
    register Sinatra::Reloader 
    after_reload do
      puts 'reloaded'
    end
  end
  
  set :root, 'controller'

  get '/' do 
    erb :index, locals: {
        store_req_pop: nil, 
        state_name: nil, 
        potential_stores: nil,
        state_average: nil,
        all_avg_and_yr: nil,
        invalid_form_value: nil
    }
  end
  
  get '/state/' do 
    erb :index, locals: {
        store_req_pop: nil, 
        state_name: nil, 
        potential_stores: nil,
        state_average: nil,
        all_avg_and_yr: nil,
        invalid_form_value: nil
    }
  end

  # pulls the params form URL
  get '/state/stats' do 
    @store_req_pop = params['store_req_pop']
    @state_name    = params['state_name']
    
    potential_stores = PopulationCalc.new(@state_name, @store_req_pop)

    if (potential_stores.set_json_data(@state_name) != nil && @store_req_pop != nil)
      
      erb :index, locals: {
        store_req_pop: @store_req_pop, 
        state_name: @state_name.capitalize(), 
        potential_stores: potential_stores.get_state_support_count,
        state_average: potential_stores.get_avg_population,
        all_avg_and_yr: potential_stores.get_year_and_avg,
        invalid_form_value: ""
      }

    else 
      erb :index, locals: {
        store_req_pop: nil, 
        state_name: nil, 
        potential_stores: nil,
        state_average: nil,
        all_avg_and_yr: nil,
        invalid_form_value: "please enter form values above"
      }

    end
  end 

end # end ApplicationController
