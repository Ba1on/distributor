class Sprint < ActiveRecord::Base
  has_many :sprint_clients
  has_many :clients, through: :sprint_clients
  has_many :issues
  validates :name, uniqueness: true, presence: true
  validates :clients, presence: true
  #validates :state,  format: { with: /\Afalse+\z/, message: "Sprint alredy closed"}, :on => :update # с ним часы не считаются
  validate :open_sprint
  accepts_nested_attributes_for :clients

  def open_sprint
    opened = Sprint.where(state: true).first
    errors.add(:sprint_id, I18n.t(:can_not_be_updated)) if (opened && (id != opened.id))
  end

end
