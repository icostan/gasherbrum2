module MountainForecast
  def self.crawl(provider)
    require 'mechanize'

    agent = Mechanize.new do |agent|
      agent.user_agent_alias = 'Mac Safari'
      agent.log = Logger.new "mech.log"
    end

    url = provider.endpoint + provider.elevation
    page = agent.get url

    date = page.search "tr.forecast__table-days td"
    date = date.map{|td| [blankify(td['data-column-name'])] * td['colspan'].to_i }.flatten
    # puts "Date: #{date.size} - #{date}"

    time = page.search "tr.forecast__table-time td"
    time = time.map{|td| blankify td.text }
    # puts "Time: #{time.size} - #{time}"

    wind = page.search "tr.forecast__table-wind td img"
    wind = wind.map{|td| blankify td['alt']}
    # puts "Wind: #{wind.size} - #{wind}"

    snow = page.search "tr.forecast__table-snow td"
    snow = snow.map{|td| blankify td.text.gsub(/-/, '0') }
    # puts "Snow: #{snow.size} - #{snow}"

    temp = page.search "tr.forecast__table-max-temperature td"
    temp = temp.map{|td| blankify td.text }
    # puts "Temp: #{temp.size} - #{temp}"

    freezing = page.search "tr.forecast__table-freezing-level td"
    freezing = freezing.map{|td| blankify td.text }
    # puts "Level: #{freezing.size} - #{freezing}"

    date = date.map{|d| {date: d} }
    time = time.map{|t| {time: t} }
    wind = wind.map{|w| {wind: w} }
    snow = snow.map{|s| {snow: s} }
    temp = temp.map{|p| {temp: p} }
    freezing = freezing.map{|f| {freezing: f} }

    # return array of {:date=>"Thu_10", :time=>"AM", :wind=>"15 SW", :snow=>"", :temp=>"-22", :freezing=>"5000"}
    date.zip(time, wind, snow, temp, freezing).map{|d| d.reduce({}) {|h, e| h.merge e}}
  end

  def self.blankify(s)
    s.delete " _\r\n"
  end
end
