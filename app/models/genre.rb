class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # Get the number of songs in the genre
    self.songs.count
  end

  def artist_count
    # Get the number of unique artists associated with the genre's songs
    self.artists.select(:id).distinct.count
  end

  def all_artist_names
    # Get the names of all artists associated with the genre's songs
    self.artists.pluck(:name)
  end
end
