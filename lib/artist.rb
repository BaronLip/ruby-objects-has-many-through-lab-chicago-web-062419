require "pry"

class Artist
    attr_reader :name, :song, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # The Artist class needs an instance method, #songs, that iterates through all songs and finds the songs that belong to that artist. Try using select to achieve this.
    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    # The Artist class needs an instance method, #new_song, that takes in an argument of a name and genre creates a new song. That song should know that it belongs to the artist.
    def new_song(name, genre)
        new_song = Song.new(name, self, genre)
    end

    # The Artist class needs an instance method, #genres that iterates over that artist's songs and collects the genre of each song.
    def genres
        songs.collect do | song |
            song.genre
        end
    end
end

