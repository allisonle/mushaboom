class Event
  @@_events = []
  attr_accessor :title, :date, :cost, :time, :tickets, :venue, :address, :description, :short_title, :event_type

  def self.build(yaml)
    event = Event.new
    event.title = yaml['title'] || "Unknown"
    event.date = yaml['date'] || "Unknown"
    event.time = yaml['time'] || "unknown"
    event.cost = yaml['cost'] || "unknown"
    event.tickets = yaml['tickets'] || "unknown"
    event.venue = yaml['venue'] || "unknown"
    event.address = yaml['address'] || "unknown"
    event.description = yaml['description'] || "No description available"
    event.short_title = yaml['mini_description'] || "No description available"
    event.event_type = yaml['event_type'] || "Unknown"

    @@_events << event
    #puts "Event#total (#{@@_events.count}) | Event#build #{yaml}"

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
      @@_events.sort{|event1, event2| event1.date <=> event2.date}
    end

    def load_all(data_source)
      data_source.each do |event_type, events|
        events.each do |event_data|
          Event.build event_data.merge({:event_type => event_type.to_sym})
        end
      end
    end
  end
end
