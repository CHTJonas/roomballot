# == Schema Information
#
# Table name: application_settings
#
#  id           :integer          not null, primary key
#  shuffle_seed :binary
#

class ApplicationSetting < ActiveRecord::Base
  @@instance = nil
  after_create :freeze
  before_save :prevent_changes
  before_update :prevent_changes
  after_update :freeze
  before_destroy :prevent_changes

  def self.instance
    @@instance || self.refresh
  end

  def self.refresh
    @@instance = self.last.freeze || self.create_with_default_settings
  end

  def self.update(*args)
    instance = self.instance.dup
    result = instance.update(*args)
    @@instance = instance
    return result
  end

  def self.create_with_default_settings
    create! do |settings|
      # Nothind to do here yet...
    end
  end

  def prevent_changes
    unless new_record?
      raise ActiveRecord::ReadOnlyRecord.new 'Application settings should be updated via the ApplicationSetting.update(*args) method.'
    end
  end
end
