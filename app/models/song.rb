class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    # Return the name of the song's genre
    self.genre.name
  end

  def drake_made_this
    # Try to find the Drake artist in the database
    drake = Artist.find_by(name: "Drake")
    # If Drake isn't found, create a new artist record
    unless drake
      drake = Artist.create(name: "Drake")
    end
    # Set the song's artist to Drake
    self.artist = drake
    self.save
  end
end
