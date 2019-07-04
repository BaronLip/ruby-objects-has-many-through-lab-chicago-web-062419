require_relative "patient.rb"
require_relative "appointment.rb"
require "pry"

class Doctor
    attr_reader :name, :date, :patient

    # The Doctor class needs a class variable @@all that begins as an empty array.
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def name
        @name
    end

    # The Doctor class needs a class method .all that lists each doctor in the class variable.
    def self.all
        @@all
    end

    # The Doctor class needs an instance method, #new_appointment, that takes in a an instance of the Patient class and a date, and creates a new Appointment. That Appointment should know that it belongs to the doctor
    def new_appointment(patient, date)
        Appointment.new(patient, date, self)
    end

    # The Doctor class needs an instance method, #appointments, that iterates through all Appointments and finds those belonging to this doctor.
    def appointments
        Appointment.all.select do | appointment |
            # binding.pry
            appointment.doctor == self
        end
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    # The Doctor class needs an instance method, #patients, that iterates over that doctor's Appointments and collects the patient that belongs to each Appointments.
    def patients
        self.appointments.collect do |appointment|
            # binding.pry
            appointment.patient
        end
    end
end