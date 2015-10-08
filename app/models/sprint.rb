class Sprint < ActiveRecord::Base
  has_many :sprint_clients
  has_many :clients, through: :sprint_clients
  validates :name, uniqueness: true, presence: true
  validate :open_sprint
  accepts_nested_attributes_for :clients

  def open_sprint
    opened = Sprint.where(state: true).first
    errors.add(:sprint_id, I18n.t(:open_sprint_exist)) if opened && (id != opened.id)
  end

  def clients_work_hours
    clients.count * 40
  end

end
