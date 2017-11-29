class Doctor

  attr_accessor :name, :patient

  def initialize(name)
    @name = name
    @appointments = []
    @patients = []
  end

  def add_appointment(appointment)
    raise AssociationTypeMismatchError, "Appointment class is expected" if !appointment.is_a?(Appointment)
    @appointments << appointment
    appointment.doctor = self
    appointment.patient.doctor = self
  end

  def appointments
    @appointments.uniq
  end

  def patients
    @appointments.each {|appointment| @patients << appointment.patient}
    @patients.uniq
  end


end
