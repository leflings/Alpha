module ApplicationHelper
  def imdb_link(id, type)
    link = "http://www.imdb.com/"
    link << "name/nm" if type == "person"
    link << "title/tt" if type == "movie"
    link << id.to_s
  end
end
