require 'spec_helper'

describe Track do

  describe "attributes" do

    it "has title, description attributes" do
      %w{title description created_at updated_at}.each do |field|
        expect(Track.attribute_names).to include field
      end
    end

  end

  it { is_expected.to belong_to :creator }

end
