class Issue < ActiveRecord::Base
  belongs_to :sprint
  belongs_to :client, foreign_key: :redmine_id,
                      primary_key: :client_id
  validate :issue_hours, on: :update

  def issue_hours
    opened = Sprint.where(state: true).first
    errors.add(:issue_id, I18n.t(:too_many_hours)) if (opened.nil? || opened.estimated_hours_to_sprint +
      estimated_hours > opened.work_hours) && sprint.present?
  end

  def process_in_percents
    ((hours / estimated_hours) * 100).to_i
  end
end
