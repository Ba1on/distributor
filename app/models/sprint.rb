class Sprint < ActiveRecord::Base
  has_many :sprint_clients
  has_many :clients, through: :sprint_clients
  has_many :issues
  validates :name, uniqueness: true, presence: true
  validates :clients, presence: true
  validate :all_sprints_closed, on: :update
  validate :open_sprint
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
end
