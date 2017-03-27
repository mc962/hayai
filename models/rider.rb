require_relative './application_model'

class Rider < ApplicationModel
  self.table_name = 'riders'

  has_many :dragons

  finalize!
end
