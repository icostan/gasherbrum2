json.extract! notification, :id, :email, :format, :send_at, :created_at, :updated_at
json.url notification_url(notification, format: :json)
