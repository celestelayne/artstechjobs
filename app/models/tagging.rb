# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ActiveRecord::Base
  belongs_to :job
  belongs_to :tag
end
