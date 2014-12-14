class Patient < ActiveRecord::Base
  has_many :appointments

  validates :name, presence: true
  validates :surname, presence: true

  def full_name
    "#{name} #{surname}"
  end
end
