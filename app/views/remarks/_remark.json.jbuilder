json.extract! remark, :id, :title, :content, :user_id, :post_id, :created_at, :updated_at
json.url remark_url(remark, format: :json)
