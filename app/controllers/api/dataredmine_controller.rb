class Api::DataredmineController < ApiController
  skip_before_filter :verify_authenticity_token, only: [:recieve]
  skip_before_filter :authorize

  def recieve
    if params[:object] == 'time entry'
      @event = Event.find_or_initialize_by(id: params[:time_entry_id])
      @event.assign_attributes(issue_id: params[:issue_id],
                               hours: params[:hours],
                               client_id: params[:redmine_id],
                               hours_date: params[:hours_date])
      return ActiveRecord::RecordNotSaved unless @event.save
    else
      @issue = Issue.find_or_initialize_by(id: params[:issue_id])
      @issue.assign_attributes(estimated_hours: params[:estimated_hours],
                               hours: params[:hours],
                               status: params[:status],
                               subject: params[:issue_subject],
                               redmine_user_id: params[:redmine_id])
      return ActiveRecord::RecordNotSaved unless @issue.save
    end
  end
end
