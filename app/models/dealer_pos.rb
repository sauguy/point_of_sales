# frozen_string_literal: true

class DealerPos < ApplicationRecord
  has_one :account, as: :accountable
end
