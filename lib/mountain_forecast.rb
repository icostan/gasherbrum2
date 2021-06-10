module MountainForecast
  def self.crawl
    require 'mechanize'

    agent = Mechanize.new do |agent|
      agent.user_agent_alias = 'Mac Safari'
      agent.log = Logger.new "mech.log"
    end

    url = 'https://www.mountain-forecast.com/peaks/Gasherbrum-II/forecasts/8035'
    page = agent.get url

    date = page.search "tr.forecast__table-days td"
    date = date.map{|td| [td['data-column-name'].strip] * td['colspan'].to_i }.flatten
    # puts "Date: #{date.size} - #{date}"

    time = page.search "tr.forecast__table-time td"
    time = time.map{|td| td.text.strip}
    # puts "Time: #{time.size} - #{time}"

    wind = page.search "tr.forecast__table-wind td img"
    wind = wind.map{|td| td['alt']}
    # puts "Wind: #{wind.size} - #{wind}"

    snow = page.search "tr.forecast__table-snow td"
    snow = snow.map{|td| td.text.strip.gsub("-", '')}
    # puts "Snow: #{snow.size} - #{snow}"

    temp = page.search "tr.forecast__table-max-temperature td"
    temp = temp.map{|td| td.text.strip}
    # puts "Temp: #{temp.size} - #{temp}"

    freezing = page.search "tr.forecast__table-freezing-level td"
    freezing = freezing.map{|td| td.text.strip}
    # puts "Level: #{freezing.size} - #{freezing}"

    date = date.map{|d| {date: d} }
    time = time.map{|t| {time: t} }
    wind = wind.map{|w| {wind: w} }
    snow = snow.map{|s| {snow: s} }
    temp = temp.map{|p| {temp: p} }
    freezing = freezing.map{|f| {freezing: f} }

    date.zip(time, wind, snow, temp, freezing).map{|d| d.reduce({}) {|h, e| h.merge e}}
  end
end
