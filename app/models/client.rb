class Client < ActiveRecord::Base
	has_many :sprint_clients
	has_many :sprints, through: :sprint_clients
end
