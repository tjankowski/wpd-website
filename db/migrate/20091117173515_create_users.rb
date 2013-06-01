# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
      
    end
    user = User.new
    user.login = APP_CONFIG['admin_login']
    user.email = APP_CONFIG['admin_email']
    user.password = APP_CONFIG['admin_password']
    user.password_confirmation = APP_CONFIG['admin_password']
    user.save(:validate => false)
  end

  def self.down
    drop_table "users"
  end
end
