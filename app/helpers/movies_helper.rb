module MoviesHelper
  def rating_stars(rating)
    stars = ""
    stars << "["
    rating.times do
      stars << "x"
    end
    (10-rating).times do
      stars << "-"
    end
    stars << "]"
    return stars
  end

end
