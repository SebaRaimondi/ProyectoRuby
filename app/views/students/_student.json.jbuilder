json.extract! student, :id, :name, :surname, :dni, :number, :email, :course_id, :created_at, :updated_at
json.url student_url(student, format: :json)
