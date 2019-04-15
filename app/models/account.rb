# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :accountable, polymorphic: true

  delegate :uid, to: :accountable

  validates :source_db,
            presence: true,
            inclusion: {
              in: SYNC_WRAPPERS,
              message: "The wrapper %{value} must be declared in the config"
            }

  def method_missing(method_name, *arguments)
    return accountable.send(method_name, *arguments) if respond_to? method_name
    super
  end

  def respond_to?(method_name, include_private = false)
    accountable.respond_to?(method_name) || super
  end
end
