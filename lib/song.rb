class Song
  attr_accessor :name, :artist_name
  @@all = []

 


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
 
 
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new

    self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical
    @@all.sort_by do |song| song.name
    end
  end

    def self.new_from_filename(name)
      
      data = name.split(" - ")
      # file_format = title_data. do |data|
      #   info = data.split(".")
        name = data[0]
        title = data[1].gsub(".mp3", "")
        file_type = data[2]
        
        
        song = self.new

        song.artist_name = name
        song.name = title
        # song.file_type = file_type
        song.save
        song

     end


     def self.create_from_filename(name)
      
      data = name.split(" - ")
      # file_format = title_data. do |data|
      #   info = data.split(".")
        name = data[0]
        title = data[1].gsub(".mp3", "")
        file_type = data[2]
        
        
        song = self.new

        song.artist_name = name
        song.name = title
        # song.file_type = file_type
        song.save
        song

     end

     def self.destroy_all
      @@all = []
    
    end




end
