# frozen_string_literal: true

module SyncWrappers
  class Salesforce
    def fetch_all
      [{
        foo: 1,
        bar: 2
      }]
    end
  end
end
