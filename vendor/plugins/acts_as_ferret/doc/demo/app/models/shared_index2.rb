# -*- encoding : utf-8 -*-
class SharedIndex2 < ActiveRecord::Base
  acts_as_ferret :index => 'shared'
end
