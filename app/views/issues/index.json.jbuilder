json.array!(@issues) do |issue|
  json.extract! @issue, :id, :estimated_hours, :hours, :status, :subject, :sprint_id, :created_at, :updated_at
  json.url issue_url(issue, format: :json)
end
