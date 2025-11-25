class Greeting < ApplicationRecord
  # Validations
  validates :message, presence: true, length: { minimum: 1, maximum: 500 }
  validates :name, length: { maximum: 100 }, allow_blank: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
  scope :by_name, ->(name) { where(name: name) }

  # Default values
  after_initialize :set_defaults, if: :new_record?

  # Instance methods
  def display_message
    if name.present?
      "#{message} - #{name}"
    else
      message
    end
  end

  def as_json(options = {})
    super(options.merge(
      methods: [:display_message],
      except: [:updated_at]
    ))
  end

  private

  def set_defaults
    self.name ||= "Anonymous"
    self.message ||= "Hello from Rails with PostgreSQL!"
  end
end
