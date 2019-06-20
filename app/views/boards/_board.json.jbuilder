json.extract! board, :id, :title, :active, :created_at, :updated_at
json.url board_url(board, format: :json)
