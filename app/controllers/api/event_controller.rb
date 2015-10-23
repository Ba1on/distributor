class Api::EventController < ApiController
  skip_before_filter :verify_authenticity_token, only: [:recieve]
  skip_before_filter :authorize

  def recieve
    @issue = Issue.find_or_initialize_by(id: params[:issue_id])

    @issue.assign_attributes(estimated_hours: params[:estimated_hours],
                             hours: params[:hours],
                             status: params[:status],
                             subject: params[:issue_subject])

    return ActiveRecord::RecordNotSaved unless @issue.save
  end
end
