class Speaker
  @@_speakers = []
  attr_accessor :first_name, :last_name, :name, :slug, :company, :bio, :linked_in, :twitter, :video

  def self.build(yaml)
    speaker = Speaker.new

    speaker.first_name = yaml['first_name'] || "Unknown"
    speaker.last_name = yaml['last_name'] || "Unknown"
    speaker.name = "#{speaker.first_name}  #{speaker.last_name}"
    speaker.slug = "#{speaker.first_name.downcase}-#{speaker.last_name.downcase}"
    speaker.company = yaml['company'] || "Unknown"
    speaker.bio = yaml['bio'] || "unknown"
    speaker.linked_in = yaml['linked_in'] || false
    speaker.twitter = yaml['twitter'] || false
    speaker.video = yaml['video'] || false

    @@_speakers << speaker
    #puts "Event#total (#{@@_speakers.count}) | Event#build #{yaml}"

    speaker
  end

  def [](key)
    self.send(key.to_sym)
  end

  def to_s
    self.name
  end

  class << self
    def all
      @@_speakers #.sort{|speaker1, speaker2| speaker1.date <=> speaker2.date}
    end

    def load_all(data_source)
      data_source.each do |speaker|
        Speaker.build speaker
      end
    end
  end
end

