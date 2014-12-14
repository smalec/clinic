require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test 'patient needs name to be created' do
    patient = Patient.new()
    assert_not patient.valid?, 'Name is obligatory'
    patient = Patient.new(surname: 'Kowalski')
    assert_not patient.valid?, 'Name is obligatory - surname is not enough'
  end

  test 'doctor needs surname to be created' do
    patient = Patient.new()
    assert_not patient.valid?, 'Surname is obligatory'
    patient = Patient.new(name: 'Jan')
    assert_not patient.valid?, 'Surname is obligatory - name is not enough'
  end

  test 'function full_name of patient' do
    patient = Patient.new(name: 'Jan', surname: 'Kowalski')
    assert_equal 'Jan Kowalski', patient.full_name
  end

  test 'patient have appointments' do
    patient = Patient.new(name: 'Jan', surname: 'Kowalski')
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    patient.appointments << appointment
    assert_equal '2015-01-11, 19:30', patient.appointments[0].date
  end
end
