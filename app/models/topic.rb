class Topic < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
end

# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :integer
#  created_at   :datetime
#  updated_at   :datetime
#
