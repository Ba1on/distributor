class Issue < ActiveRecord::Base
  belongs_to :sprint
  validate :issue_hours, on: :update

  def issue_hours
    opened = Sprint.where(state: true).first
    errors.add(:issue_id, I18n.t(:too_many_hours)) if (opened.nil? || opened.estimated_hours_to_sprint +
      estimated_hours > opened.work_hours) && sprint_id
  end
end
