class Venue < ActiveRecord::Base
    has_many :concerts
    has_many :bands, through: :concerts


    def concert_on(date)
        Concert.where(date: date).first
    end

    def most_frequent_band
        self.bands.max {|b1, b2| b1.concerts.length <=> b2.concerts.length}
    end

end