json.extract! form_submission, :id, :name, :email, :message, :created_at, :updated_at
json.url form_submission_url(form_submission, format: :json)
