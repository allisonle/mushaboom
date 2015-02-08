class City
  @@_cities = []
  attr_accessor :name, :state, :population, :country

  def self.build(yaml)
    event = City.new
    event.name = yaml['name'] || "Unknown"
    event.state = yaml['state'] || "Unknown"
    event.population = yaml['population'] || "unknown"
    

    @@_cities << event
    #puts "City#total (#{@@_cities.count}) | City#build #{yaml}"

    event
  end

  def [](key)
    self.send(key.to_sym)
  end

  def to_s
    self.name
  end

  class << self
    def all
      @@_cities.sort{|event1, event2| event1.date <=> event2.date}
    end

    def load_all(data_source)
      data_source.each do |event_type, cities|
        cities.each do |event_data|
          Event.build event_data.merge({:event_type => event_type.to_sym})
        end
      end
    end
  end
end
