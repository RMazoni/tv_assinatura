json.extract! subscription, :id, :client_id, :package_id, :plan_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
