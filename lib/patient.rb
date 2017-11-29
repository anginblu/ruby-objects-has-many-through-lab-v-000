class Patient
  attr_accessor :name, :appointment, :doctor

  def initialize(name)
    @name = name
    @doctors = []
    @appointments = []
  end

  def add_appointment(appointment)
    raise AssociationTypeMismatchError, "Appointment class is expected" if !appointment.is_a?(Appointment)
    @appointments << appointment unless self.appointments.include?(appointment)
    appointment.patient = self
    appointment.doctor.patient = self
    @doctors << appointment.doctor
  end

  def doctors
    @doctors.uniq
  end

end
