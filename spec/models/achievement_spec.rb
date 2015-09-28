require 'spec_helper'

describe Achievement do
    describe "attributes" do
        it "include duration, score" do
            %w{duration score}.each do |field|
                expect(Achievement.attribute_names).to include field
                expect(Achievement.column_names).to include field
            end
        end
    end

    it { is_expected.to have_one(:user)
        .through(:enrollment)
    }
    it { is_expected.to belong_to(:milestone) }
    it "validates presence of enrollment_id" do
        a = Achievement.new
        expect(a).to have(1).error_on(:enrollment_id)
        a.enrollment_id = 1
        expect(a).to have(0).error_on(:enrollment_id)
    end
    it "validates presence of milestone_id" do
        a = Achievement.new
        expect(a).to have(1).error_on(:milestone_id)
        a.milestone_id = 1
        expect(a).to have(0).error_on(:milestone_id)
    end
end

# == Schema Information
#
# Table name: achievements
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  milestone_id :integer          not null
#  duration     :integer
#  score        :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_achievements_on_milestone_id  (milestone_id)
#  index_achievements_on_user_id       (user_id)
#
