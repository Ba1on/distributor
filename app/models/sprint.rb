class Sprint < ActiveRecord::Base
  has_many :sprint_clients
  has_many :clients, through: :sprint_clients
  has_many :issues
  validates :name, uniqueness: true, presence: true
  validates :clients, presence: true
  validate :all_sprints_closed, on: :update
  validate :open_sprint
  validates :work_hours, numericality: {greater_than_or_equal_to: :estimated_hours_to_sprint}, on: :update
  accepts_nested_attributes_for :clients

  def open_sprint
    opened = Sprint.where(state: true).first
    errors.add(:sprint_id, I18n.t(:can_not_be_updated)) if
                opened && (id != opened.id)
  end

  def all_sprints_closed
    opened = Sprint.where(state: true).any?
    errors.add(:sprint_id, I18n.t(:this_sprint_already_closed)) unless opened
  end

  def estimated_hours_to_sprint
    issues.sum(:estimated_hours)
  end

  # лишний метод
  def sum_est_hours
    opened = Sprint.where(state: true).first
    errors.add(:sprint_id, I18n.t(:too_many_hours)) if
      opened.estimated_hours_to_sprint > opened.work_hours
  end
end
