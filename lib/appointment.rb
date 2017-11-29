class Appointment
  attr_accessor :name, :patient, :doctor

  def initialize(name, doctor)
    @name = name
    @doctor = doctor
    doctor.appointments << self
  end

  def patient=(patient)
    raise AssociationTypeMismatchError, "Patient class is expected" if !patient.is_a?(Patient)
    @patient = patient unless self.patient == patient
  end

  def artist=(artist)
    raise AssociationTypeMismatchError, "Artist class is expected" if !artist.is_a?(Artist)
    unless self.artist == artist
      @artist = artist
      genre.artists << self.artist
    end
  end
end
