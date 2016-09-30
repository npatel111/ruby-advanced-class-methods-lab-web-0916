require 'pry'

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
    song = self.new #instantiate song
    song.save #save it
    song #return
  end

  def self.new_by_name(name)
    # goal - instantiate song with name property
    song = self.new #returns song instance
    song.name = name #with name set as name property
    song # song instance
  end

  def self.create_by_name(name)
    song = self.new #returns song instance
    song.name = name #name set as it's name property
    song.save # song saved into @all class variabble
    song # returns song instance
  end

  def self.find_by_name(name)

    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_artist_name = filename.slice(0..(filename.index("-") -2))
    song_name = filename.slice(filename.index("- ") + 2..-1).chomp(".mp3")

    song = self.new
    song.name = song_name
    song.artist_name = song_artist_name
    song.save
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
#binding.pry
end
#Pry.start
