class Project < ApplicationRecord
    validates :name, :tool, presence: true
end
