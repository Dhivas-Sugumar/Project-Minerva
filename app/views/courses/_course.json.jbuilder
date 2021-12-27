json.extract! course, :id, :title, :description, :members, :average, :rating, :course_id, :created_at, :updated_at
json.url course_url(course, format: :json)
