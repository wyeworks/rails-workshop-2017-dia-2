json.extract! board, :id, :name, :visibility, :favorite, :created_at, :updated_at
json.url board_url(board, format: :json)
