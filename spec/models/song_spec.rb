require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:valid_attributes) do 
    {
      title: "Love Is All",
      artist_name: "Tallest Man on Earth",
      release_year: 2010,
      released: true,
      genre: "Folk"
    }
  end

  
end
