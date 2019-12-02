class Song < ApplicationRecord
    validates :title, presence: true #invalid without a title
    validates :title, uniqueness: {scope: [:artist_name, :release_year]} #invalid if an artist tries to reliease the same song twice in a year
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    
      def released?
        released
      end
    
end
