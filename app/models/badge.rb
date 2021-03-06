class Badge < ActiveRecord::Base

  scope :by_type, ->(type){where(badge_type:type)}
  scope :with_points, -> {where "points > 0"}
  scope :less_or_equal_points_than, ->(points){ where("points <= ?", points) }
  scope :more_or_equal_points_than, ->(points){ where("points >= ?", points) }

  #Relationships
  has_many :issues
  has_many :players, through: :issues
  belongs_to :project

  #Validations
  validates :name, uniqueness: { scope: :project_id,
    message: "Can't repeat badge name by project" }
end
