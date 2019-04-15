# frozen_string_literal: true

class AccountSync
  attr_reader :wrappers

  def initialize
    @wrappers = SYNC_WRAPPERS.map do |wrapper|
      Object.const_get("SyncWrappers::#{wrapper.capitalize}").new
    end
  end

  def synchronize_all
    wrappers.each do |wrapper|
      wrapper.fetch_all.each do |result|
        create_or_update(wrapper, result)
      end
    end
  end

  private

  def create_or_update(wrapper, data)
    puts "Updating for #{source_for(wrapper)}..."
    puts data
  end

  def source_for(wrapper)
    wrapper.class.name.demodulize.downcase
  end
end
