class Detail < ActiveRecord::Base
	belongs_to :caso
	has_many :guns, through: :weapon
	has_many :people, through: :primesuspect
	has_many :people, through: :personinvolved
	has_many :people, through: :guilty
end
