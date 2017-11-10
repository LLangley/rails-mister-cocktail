# Data (Model)
# The model represents the data, and does nothing else.
# The model does NOT depend on the controller or the view.



class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses
  validates :name, presence: true, uniqueness: true
end
