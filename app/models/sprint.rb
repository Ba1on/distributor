class Sprint < ActiveRecord::Base
	has_many :sprint_clients
	has_many :clients, through: :sprint_clients
	accepts_nested_attributes_for :clients

	def add_client_to_sprint(client_ids)
		clients << Client.where(id: client_ids)		
	end

end
