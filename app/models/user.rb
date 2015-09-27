class User < ActiveRecord::Base

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable

    include Authority::UserAbilities

    has_many :contributors

    has_many :contributable_tracks,
             source: :track,
             through: :contributors

    has_many :enrollments

    has_many :enrolled_tracks,
             source: :track,
             through: :enrollments

    has_many :achievements,
             through: :enrollments

    has_many :achieved_milestones,
             through: :achievements,
             source: :milestone

    validates :name,
        presence: true,
        length: { minimum: 5, maximum: 30 }

end
