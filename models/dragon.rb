require_relative '../lib/mono_rm/model_base'


class Dragon < ModelBase
  self.table_name = 'dragons'
  belongs_to :rider
  has_many :memories

  finalize!
end
