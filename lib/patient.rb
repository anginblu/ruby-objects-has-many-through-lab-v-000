class Patient
  attr_accessor :name, :appointment, :doctor

  def initialize(name)
    @name = name
    @doctors = []
    @appointments = []
  end

  def add_appointment(appointment)
    raise AssociationTypeMismatchError, "Appointment class is expected" if !appointment.is_a?(Appointment)
    @appointments << appointment
    appointment.patient = self
    appointment.doctor.patient = self
  end

  def appointments
    @appointments.uniq
  end

  def doctors
    @appointments.each {|appointment| @doctors << appointment.doctor}
    @doctors.uniq
  end


end
