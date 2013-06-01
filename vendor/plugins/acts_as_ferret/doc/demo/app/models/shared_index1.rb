# -*- encoding : utf-8 -*-
class SharedIndex1 < ActiveRecord::Base
  acts_as_ferret :index  => 'shared'
end
