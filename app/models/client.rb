class Client < ActiveRecord::Base
  has_many :sprint_clients
  has_many :sprints, through: :sprint_clients
  validates :name, presence: true, uniqueness: true
end
