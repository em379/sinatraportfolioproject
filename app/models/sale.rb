class Sale < ActiveRecord::Base
  validates :business_name, :location, :sale, presence: true
  belongs_to :user


end
