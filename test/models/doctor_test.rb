require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  test 'doctor needs name to be created' do
    doctor = Doctor.new()
    assert_not doctor.valid?, 'Name is obligatory'
    doctor = Doctor.new(surname: 'Kowalski')
    assert_not doctor.valid?, 'Name is obligatory - surname is not enough'
  end

  test 'doctor needs surname to be created' do
    doctor = Doctor.new()
    assert_not doctor.valid?, 'Surname is obligatory'
    doctor = Doctor.new(name: 'Jan')
    assert_not doctor.valid?, 'Surname is obligatory - name is not enough'
  end

  test 'function full_name of doctor' do
    doctor = Doctor.new(name: 'Jan', surname: 'Kowalski')
    assert_equal 'Jan Kowalski', doctor.full_name
  end

  test 'doctor have appointments' do
    doctor = Doctor.new(name: 'Jan', surname: 'Kowalski')
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    doctor.appointments << appointment
    assert_equal '2015-01-11, 19:30', doctor.appointments[0].date
  end
end
