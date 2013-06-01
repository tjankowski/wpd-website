# -*- encoding : utf-8 -*-
class ProductCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
end
