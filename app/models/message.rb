require 'facebook'

class Message < ApplicationRecord
  after_commit :publish_to_facebook, on: :create, if: -> { Rails.env.production? }

  def publish_to_facebook
    raise "the fuck" unless Rails.env.production?

    facebook = Facebook.new
    result = facebook.post message
    update fbid: result['id']
  end
end
