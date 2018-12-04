module ReleasesHelper
  def release_date(release)
    if 1.week.ago < release.date && release.date < Time.now
      "#{time_ago_in_words release.date} ago"
    else
      release.date.strftime('%a, %b %d · %I:%M %p')
    end
  end
end
