class SprintClient < ActiveRecord::Base
  belongs_to :client
  belongs_to :sprint
end
