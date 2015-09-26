class Topic < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
end
