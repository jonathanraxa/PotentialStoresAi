require 'httparty'

# [{"id":"0400000US06","name":"California","type":"state","year":"2013","population":"37659181","population_percent_change":"0.895"}

class PopulationCalc
  
  
  attr_accessor :state_name, :population_requirement
  
  include HTTParty
  base_uri 'https://odn.data.socrata.com/'

 
  def initialize(state_name = 'wyoming', population_requirement = 10000)
    @state_name = state_name
    @population_requirement = (population_requirement).to_i
  end

  def get_store_support_count
    puts @population_requirement
    count = set_store_support_count(@state_name, @population_requirement)
    puts "#{count} stores"
  end

  private

  # updates data retrieved from API
  def set_store_support_count(state_name, pop_req)
    begin  
      json_data = self.class.get("/resource/tx2x-uhib.json?name=#{state_name.capitalize()}")
      if json_data
        puts "successfully updated"
        avg_pop = get_average_population(json_data)
        num_stores_support = calc_num_of_stores(avg_pop, pop_req)
      end
      rescue
        puts 'JSON Data Error - update data'
    end
    num_stores_support
  end

  # returns average population
  def get_average_population(json_data)
    total = 0
    json_data.each do |index|
      total = total + (index['population']).to_i  
    end
    total / json_data.length()
  end

  # returns number of stores state can support
  def calc_num_of_stores(avg_pop, pop_req)
    avg_pop / pop_req
  end

end