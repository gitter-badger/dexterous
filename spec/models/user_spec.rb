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
end
