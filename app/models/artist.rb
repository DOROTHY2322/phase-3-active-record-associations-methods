class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    # Get the artist's first saved song
    first_song = self.songs.order(:created_at).first
    # Return the genre of the first saved song, or nil if there are no saved songs
    first_song.genre if first_song
  end
  
  def song_count
    # Get the number of songs associated with the artist
    self.songs.count
  end
  
  def genre_count
    # Get the number of unique genres associated with the artist's songs
    self.songs.select(:genre_id).distinct.count
  end
end
