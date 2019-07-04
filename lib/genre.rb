
class Genre
    attr_reader :artist, :song, :genre

    @@all_genres = []

    def initialize(genre)
        @genre = genre
        # @artist = artist
        # @song = song
        @@all_genres<<self
    end

    def name
       @genre 
    end

    # The Genre class needs an instance method, songs, that iterates through all songs and finds the songs that belong to that genre.
    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end

    def self.all
        @@all_genres
    end

    # The Genre class needs an instance method, artists, that iterates over the genre's collection of songs and collects the artist that owns each song.
    def artists
        songs.collect do |song|
            song.artist
        end
    end
end


