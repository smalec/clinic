require 'test_helper'

class ExampleIntegrationTest < ActionDispatch::IntegrationTest
  test 'some simple operations' do
    get '/doctors'
    assert_response :success
    assert_template 'doctors/index'
    assert_equal assigns(:doctors).count, 2

    get '/doctors/new'
    assert_response :success

    post_via_redirect '/doctors', doctor: {name: 'King', surname: 'Schultz'}
    doctor = assigns(:doctor)
    assert doctor.valid?
    assert_response :success
    assert_template 'doctors/show'

    get '/doctors'
    assert_response :success
    assert_template 'doctors/index'
    assert_equal assigns(:doctors).count, 3

    get '/patients'
    assert_response :success
    assert_template 'patients/index'
    assert_equal assigns(:patients).count, 2

    get '/patients/new'
    assert_response :success

    post_via_redirect '/patients', patient: {name: 'Jan', surname: 'Kowalski'}
    patient = assigns(:patient)
    assert patient.valid?
    assert_response :success
    assert_template 'patients/show'

    get '/patients'
    assert_response :success
    assert_template 'patients/index'
    assert_equal assigns(:patients).count, 3

    get '/appointments'
    assert_response :success
    assert_template 'appointments/index'
    assert_equal assigns(:appointments).count, 2

    get '/appointments/new'
    assert_response :success

    post_via_redirect '/appointments', appointment: {date: '2015-01-11, 19:45', doctor_id: doctor.id, patient_id: patient.id}
    assert assigns(:appointment).valid?
    assert_response :success
    assert_template 'appointments/show'

    get '/doctors/' + doctor.id.to_s + '/appointments'
    assert_response :success
    assert_equal assigns(:appointments).count, 1
  end
end