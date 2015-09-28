class Sprint < ActiveRecord::Base
	has_many :sprint_clients
	has_many :clients, through: :sprint_clients

end
