require_relative './application_model'

class Memory < ApplicationModel
  self.table_name = 'memories'
  belongs_to :dragon
  has_one_through :rider, :dragon, :rider

  finalize!
end
