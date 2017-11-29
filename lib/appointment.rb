class Appointment
  attr_accessor :name, :patient, :doctor

  def initialize(name, doctor)
    @name = name
    @doctor = doctor
    doctor.appointments << self
  end

  def patient=(patient)
    raise AssociationTypeMismatchError, "Patient class is expected" if !patient.is_a?(Patient)
    unless self.patient == patient
      @patient = patient
      doctor.patients << self.patient
    end
  end

  def doctor=(doctor)
    raise AssociationTypeMismatchError, "Artist class is expected" if !artist.is_a?(Artist)
    @doctor = doctor unless self.doctor == doctor
  end
  
end
