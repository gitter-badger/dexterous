require 'spec_helper'

describe Track do

  describe "attributes" do

    it "include title, description created_at update_at" do
      %w{title description created_at updated_at}.each do |field|
        expect(Track.attribute_names).to include field
        expect(Track.column_names).to include field
      end
    end

  end

  it { is_expected.to belong_to :owner }

  it "can be created by any user" do
    expect(Track.creatable_by? build(:user)).to be true
  end

  context "with open visibility" do

    before :each do
      @track = build :track, visibility: 'open'
    end

    it "can be viewed by any user" do
      expect(build(:user).can_view? @track).to be true
    end

    it "can be viewed by guests" do
      expect(@track.viewable_by? nil).to be true
    end
  end

  context "with public visibility" do
    before :each do
      @track = build :track, visibility: 'public'
    end

    it "can be viewed by any user" do
      expect(build(:user).can_view? @track).to be true
    end

    it "can not be viewed by guests" do
      expect(@track.viewable_by? nil).to be false
    end

    context "with blacklisted users" do
      it "can not be viewed by blacklisted users" do
        user = create :user
        track = create :track, visibility: 'public'
        Permission.create! track: track, user: user, can_view: false
        expect(track.viewable_by? user).to be false
        expect(user.can_view? track).to be false
      end
    end
  end

  context "with restricted visibility" do
    before :each do
      @track = build :track, visibility: 'restricted'
    end

    it "can not be viewed by guests" do
      expect(@track.viewable_by? nil).to be false
    end

    it "can not be viewed by non-enrolled users" do
      expect(@track.viewable_by? build :user).to be false
    end

    it "can be viewed by whitelisted users" do
      p = Permission.create(
        track: create(:track, visibility: 'restricted'),
        user: create(:user),
        can_view: true
      )
      expect(p.track.viewable_by? p.user).to be true
    end

  end
end
