class Page < ActiveRecord::Base
  acts_as_ferret :fields => [:title, :body]

  validates_uniqueness_of :title, :message => 'już istnieje.'
end

