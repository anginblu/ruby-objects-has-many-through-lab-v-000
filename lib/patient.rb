class Patient
  attr_accessor :name, :appointment, :doctor

  def initialize(name)
    @name = name
    @doctors = []
  end

  def add_appointment(appointment)
    raise AssociationTypeMismatchError, "Appointment class is expected" if !appointment.is_a?(Appointment)
    @appointments << appointment unless self.appointments.include?(appointment)
    appointment.patient = self
    appointment.doctor.patient = self
  end

  def doctors
    @doctors
  end

  def doctor=(doctor)
    raise AssociationTypeMismatchError, "Artist class is expected" if !artist.is_a?(Artist)
    @doctor = doctor unless self.doctor == doctor
  end

end
