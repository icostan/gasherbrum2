require 'koala'

class Facebook
  def initialize
    @graph = Koala::Facebook::API.new ENV['ACCESS_TOKEN']
  end

  def post(message)
    @graph.put_wall_post message
  end

  def profile()
    @graph.get_object "me"
  end
end
