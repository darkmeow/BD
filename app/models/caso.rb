class Caso < ActiveRecord::Base
	belongs_to :user
	has_many :people
	has_one :detail
end
