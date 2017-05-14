module Lucid
  module Intercom
    APP_ACCESS_TOKEN = ENV['INTERCOM_APP_ACCESS_TOKEN'].dup.freeze || raise('INTERCOM_APP_ACCESS_TOKEN is unset')
    APP_ID = ENV['INTERCOM_APP_ID'].dup.freeze || raise('INTERCOM_APP_ID is unset')
    APP_PREFIX = ENV['INTERCOM_APP_PREFIX'].dup.freeze || raise('INTERCOM_APP_PREFIX is unset')
  end
end
