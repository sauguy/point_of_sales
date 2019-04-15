# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Account do
  subject { described_class.new(account_data) }

  describe '#wrapper_exists' do
    let(:accountable) { FactoryBot.build(:dealer_pos) }
    let(:account_data) { { accountable: accountable, source_db: source_db } }

    before do
      stub_const('SYNC_WRAPPERS', ['salesforce'])
    end

    context 'when the wrapper exists' do
      let(:source_db) { 'salesforce' }

      it { expect(subject.valid?).to be true }
    end

    context 'when the wrapper does not exist' do
      let(:source_db) { 'foo' }

      it { expect(subject.valid?).to be false }
    end
  end
end
