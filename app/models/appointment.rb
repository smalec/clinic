class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  validates :date, presence: true, format: { with:
                   /\A\d{4}[-]([0][1-9]|[1][0-2])[-]([0][1-9]|[1-2]\d|[3][0-1])\s*[,]\s*([0-1]\d|[2][0-3])[:][0-5]\d\Z/ }

  def time
    date.split(',')[1].strip
  end

  def day
    date.split(',')[0].strip
  end
end
