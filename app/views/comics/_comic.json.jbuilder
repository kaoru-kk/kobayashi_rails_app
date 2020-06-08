json.extract! comic, :id, :author, :title, :overview, :seriazation_status, :created_at, :updated_at
json.url comic_url(comic, format: :json)
