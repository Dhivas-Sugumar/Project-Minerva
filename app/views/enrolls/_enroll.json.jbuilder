json.extract! enroll, :id, :user_id, :course_id, :completed, :created_at, :updated_at
json.url enroll_url(enroll, format: :json)
