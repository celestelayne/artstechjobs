class Job < ActiveRecord::Base
	validates :title, presence: true
	validates :company, presence: true
	validates :city, presence: true
	validates :url, presence: true, uniqueness: true

	has_many :taggings
	has_many :tags, through: :taggings

	def all_tags=(names)
		self.tags = names.split(",").map do |name|
			Tag.where(name: name.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
		Tag.find_by_name!(name).jobs
	end

end
