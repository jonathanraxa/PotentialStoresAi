require 'httparty'

class PopulationCalc
  
  attr_accessor :state_name, :population_requirement
  
  include HTTParty
  base_uri 'https://odn.data.socrata.com/'

  def initialize(state_name = 'wyoming', population_requirement = 10000)
    @state_name = state_name
    @population_requirement = (population_requirement).to_i
  end

  # updates api retrieval to json_data instance variable
  def set_json_data(state_name)
    @json_data = set_json(state_name)
  end

  # how many stores the state could support
  def get_state_support_count
    avg_pop = get_avg_population
    count = set_state_support_count(avg_pop, @population_requirement)
  end

  # average population of state
  def get_avg_population
    if @json_data != nil
      avg_pop = calc_average_population
    end
  end

  # create a hash table of year and population
  # ie. ['2013', '33023944']
  def get_year_and_avg
   if @json_data != nil
      all_year_and_pop = Hash.new    
      @json_data.each do |index|
        all_year_and_pop[index['year']] = index['population']
      end
      all_year_and_pop  
    end  
  end

  # retrieves all the years
  def get_all_years
    all_year = Array.new    
    @json_data.each do |index|
      all_year.push(index['year'])
    end
    all_year
  end

  # retrieves all the state avg population
  def get_all_avg_population
    all_avg_pop = Array.new    
    @json_data.each do |index|
      all_avg_pop.push(index['population'])
    end
    all_avg_pop
  end

  private

  # retrieves JSON data from API - runs immediately upon object instantiation
  def set_json(state_name)
    begin  

      json_data = self.class.get("/resource/tx2x-uhib.json?name=#{state_name.capitalize()}")
      
      if json_data.length() > 0
        puts "JSON set successfully" 
        json_data
      else
        json_data = nil      
      end
      rescue
        json_data = nil
        puts 'JSON Data Error - Set JSON'
    end
    
  end

  # updates data retrieved from API
  def set_state_support_count(avg_pop, pop_req) 
    num_stores_support = calc_num_of_stores(avg_pop, pop_req)
  end

  # returns average population
  def calc_average_population
    total = 0
    @json_data.each do |index|
      total = total + (index['population']).to_i  
    end
    total / @json_data.length()
  end

  # returns number of stores state can support
  def calc_num_of_stores(avg_pop, pop_req)
    avg_pop / pop_req
  end

end