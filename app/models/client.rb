class Client < ActiveRecord::Base
  has_many :sprint_clients
  has_many :sprints, through: :sprint_clients
  has_many :issues
  validates :name, presence: true, uniqueness: true
end
