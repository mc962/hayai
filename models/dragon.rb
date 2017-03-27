require_relative './application_model'


class Dragon < ApplicationModel
  self.table_name = 'dragons'
  belongs_to :rider
  has_many :memories

  finalize!
end
