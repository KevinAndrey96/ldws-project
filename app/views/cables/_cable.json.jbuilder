json.extract! cable, :id, :name, :ctype, :structure, :connector_id, :ethernet_id, :category_id, :created_at, :updated_at
json.url cable_url(cable, format: :json)
