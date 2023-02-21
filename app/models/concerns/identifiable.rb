# frozen_string_literal: true

# Public: This is a Rails Concern that can be included into an ActiveRecord model
#         so that an unique identifier is specified on model creation.
module Identifiable
  extend ActiveSupport::Concern

  included do
    before_validation :assign_identifier, on: :create
  end

  # Public: Set Unique UUid for use as a unique key
  def assign_identifier
    self.id ||= SecureRandom.uuid
  end
end
