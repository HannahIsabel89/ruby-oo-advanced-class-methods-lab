class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #instantiates and saves the song, and it returns the new song that was created
  def self.create
    # create new instance of a song
    new_song = Song.new
    # save new instance into array
    new_song.save
    # return new instance 
    new_song
  end

  # instantiates a song with a name property
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  # instantiates and saves a song with a name property
  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  #can find a song present in @@all by name
  def self.find_by_name(name)
    all.find{|song| song.name == name}
  end

  # invokes .find_by_name and .create_by_name instead of repeating code 
  def self.find_or_create_by_name(name)
    result = find_by_name(name)
    return result if result !=nil
    create_by_name(name)
  end

  # returns all the song instances in alphabetical order by song name
  def self.alphabetical
    all.sort_by{|song| song.name}
  end

  # initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    artist_name, song_name = filename.split(" - ")[0], filename.split(" - ")[1].split(".")[0]
    new_song = new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  # initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    artist_name, song_name = filename.split(" - ")[0], filename.split(" - ")[1].split(".")[0]
    new_song = create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  #clears all the song instances from the @@all array
  def self.destroy_all
    @@all.clear
  end

end
