class Song < ApplicationRecord
    include ActiveModel::Validations
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true

    with_options if: :is_released? do |released|
        released.validates :release_year, presence: true
        released.validates :release_year, numericality: true
        released.validates :release_year, numericality: { only_integer: true }
        # byebug

        released.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    end

    def is_released?
        released
    end
end
