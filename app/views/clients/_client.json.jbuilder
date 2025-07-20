json.extract! client, :id, :name, :birth_date, :plan_id, :package_id, :created_at, :updated_at
json.url client_url(client, format: :json)
