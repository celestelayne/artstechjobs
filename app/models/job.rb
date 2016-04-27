# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  title      :string
#  company    :string
#  city       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Job < ActiveRecord::Base
	validates :title, presence: true
	validates :company, presence: true
	validates :city, presence: true
	validates :url, presence: true, uniqueness: true

	has_many :taggings, :dependent => :destroy
	has_many :tags, through: :taggings

  belongs_to :user
  validates :user_id, presence: true

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
