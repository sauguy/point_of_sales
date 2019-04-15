# frozen_string_literal: true

SYNC_WRAPPERS =
  YAML.load_file(File.join(Rails.root, 'config', 'sync_wrappers.yml')).keys
