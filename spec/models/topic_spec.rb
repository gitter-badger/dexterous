require 'spec_helper'

describe Topic do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  subject_id   :integer          not null
#  subject_type :integer          not null
#  title        :string           not null
#  slug         :string           not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_topics_on_slug                                  (slug) UNIQUE
#  index_topics_on_subject_id_and_subject_type_and_slug  (subject_id,subject_type,slug)
#
