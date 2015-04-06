class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validates_presence_of :name
	validates_uniqueness_of :name
end
