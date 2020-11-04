class Logement < ApplicationRecord
    belongs_to :user
    has_one :adresse
    has_one :map
    has_one :condition
    has_many :calendriers
    has_many :equipements
    has_many :regles
    has_many :chambres
    has_many :salons
    has_many :autres
end
