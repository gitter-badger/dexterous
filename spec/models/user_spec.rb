require 'spec_helper'

describe User do

    describe "permissions" do
        it { is_expected.to have_many :permissions }
         
        %w{view edit contribute manage}.each do |field|
            it { is_expected.to have_many :"#{field}_permissions" }
        end
         
        %w{viewable editable contributable manageable}.each do |adj|
            it { is_expected.to have_many :"#{adj}_tracks" }
        end
    end

    it { is_expected.to have_many(:tracks).through(:permissions) }
    it { is_expected.to have_many(:owned_tracks) }
    it { is_expected.to have_many :enrollments }
    it { is_expected.to have_many(:achievements) 
        .through(:enrollments)
    }
    it { is_expected.to have_many(:achieved_milestones)
        .through(:achievements)
        .source(:milestone)
    }
    it { is_expected.to have_many(:enrolled_tracks)
        .through(:enrollments)
        .source(:track)
    }

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
