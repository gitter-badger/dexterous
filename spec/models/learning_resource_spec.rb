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
#  title        :string
#  milestone_id :integer
#  track_id     :integer
#  owner_id     :integer
#  description  :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#
