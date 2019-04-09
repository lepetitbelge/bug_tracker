class Bug < ApplicationRecord
  belongs_to :user
  # destroys fix if bug is deleted
  has_one :fix, dependent: :destroy

  validates_presence_of :title, :description
end
