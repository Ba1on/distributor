class Sprint < ActiveRecord::Base
  has_many :sprint_clients
  has_many :clients, through: :sprint_clients
  has_many :issues
  validates :name, uniqueness: true, presence: true
  validates :clients, presence: true
  validate :all_sprints_closed, on: :update
  validate :open_sprint
  validates :work_hours, numericality: { greater_than_or_equal_to: :estimated_hours_to_sprint }, on: :update
  accepts_nested_attributes_for :clients

  def open_sprint
    opened = Sprint.where(state: 1).first || Sprint.where(state: 2).first
    errors.add(:sprint_id, I18n.t(:can_not_be_updated)) if
                opened && (id != opened.id)
  end

  def all_sprints_closed
    opened = Sprint.where(state: 1).any? || Sprint.where(state: 2).any?
    errors.add(:sprint_id, I18n.t(:this_sprint_already_closed)) unless opened
  end

  def estimated_hours_to_sprint
    issues.sum(:estimated_hours)
  end

  def hours_to_sprint
    issues.sum(:hours)
  end

  def process_in_percents
    ((hours_to_sprint / work_hours) * 100).to_i
  end
end
