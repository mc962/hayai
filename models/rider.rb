require_relative '../lib/mono_rm/model_base'
require_relative './dragon'

class Rider < ModelBase
  self.table_name = 'riders'

  has_many :dragons

  finalize!
end
