module PeopleHelper
  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def imdb_link(id)
    "http://www.imdb.com/name/nm#{id}"
  end
end
