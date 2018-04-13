json.extract! request, :id, :title, :company_id, :description, :objective, :observation, :web, :bd, :aplications, :proxy, :voip, :video_conference, :active_dir, :dhcp, :dns, :ftp, :logical_id, :physical_id, :created_at, :updated_at
json.url request_url(request, format: :json)
