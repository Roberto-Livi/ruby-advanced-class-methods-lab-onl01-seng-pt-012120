require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    song_name = self.new
    song_name.name = name
    song_name
  end
  
  def self.create_by_name(name)
    create_name = self.new
    create_name.name = name
    create_name.save
    create_name
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all.clear
  end

end

