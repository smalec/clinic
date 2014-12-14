require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  test 'appointment needs a date to be created' do
    appointment = Appointment.new()
    assert_not appointment.valid?, 'Date is obligatory'
  end

  test 'appointment has a correct format' do
    appointment = Appointment.new(date: '2015.01.11, 19:30')
    assert_not appointment.valid?, 'Date with "." is not valid'
    appointment = Appointment.new(date: '11.01.2015, 19:30')
    assert_not appointment.valid?, 'First should be year and date with "." is not valid'
    appointment = Appointment.new(date: '11-01-2015, 19:30')
    assert_not appointment.valid?, 'First should be year'
    appointment = Appointment.new(date: '2015-1-11, 19:30')
    assert_not appointment.valid?, 'Month(and day) should have following 0'
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    assert appointment.valid?, '2015-01-11, 19:30 is a valid format of date'
    appointment = Appointment.new(date: '2015-01-11,19:30')
    assert appointment.valid?, '2015-01-11,19:30 is a valid format of date (whitespaces between date and time can be
                                                                                                              omitted)'
  end

  test 'appointment has date' do
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    assert_equal '2015-01-11, 19:30', appointment.date
  end

  test 'appointment belongs to doctor' do
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    doctor = Doctor.new(name: 'Jan', surname: 'Kowalski')
    appointment.doctor = doctor
    assert_equal 'Kowalski', appointment.doctor.surname
  end

  test 'appointment belongs to patient' do
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    patient = Patient.new(name: 'Jan', surname: 'Kowalski')
    appointment.patient = patient
    assert_equal 'Kowalski', appointment.patient.surname
  end

  test 'function time of appointment' do
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    assert_equal '19:30', appointment.time
  end

  test 'function day of appointment' do
    appointment = Appointment.new(date: '2015-01-11, 19:30')
    assert_equal '2015-01-11', appointment.day
  end
end
