class Comment < ApplicationRecord
  belongs_to :prototype
  beloggs_to :user
end
