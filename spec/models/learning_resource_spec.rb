require 'spec_helper'

describe LearningResource do
    describe "attributes" do

        %w{url title description metadata}.each do |field|
            it "include #{field}" do
                expect(LearningResource.attribute_names).to include field
                expect(LearningResource.column_names).to include field
            end
        end

        it "allows only valid urls" do
            lr = build(:learning_resource, url: 'http://www.lorefnon.com')
            expect(lr.valid?).to be true
            expect(build(:learning_resource,
                url: 'random string').valid?
            ).to be false
        end
    end
    it { is_expected.to belong_to(:milestone) }
    it { is_expected.to belong_to(:track) }

end

# == Schema Information
#
# Table name: learning_resources
#
#  id           :integer          not null, primary key
#  url          :string
#  title        :string           not null
#  slug         :string           not null
#  milestone_id :integer
#  track_id     :integer          not null
#  description  :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_learning_resources_on_milestone_id_and_slug  (milestone_id,slug)
#  index_learning_resources_on_slug                   (slug) UNIQUE
#  index_learning_resources_on_track_id_and_slug      (track_id,slug)
#
