require 'rubygems'
require 'active_record'
require File.expand_path(File.dirname(__FILE__) + '/user.rb')

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => 'root',
  :password => 'admin',
  :database => 'extend_attributes_test',
  :socket   => '/var/run/mysqld/mysqld.sock'
)

ActiveRecord::Schema.define do
  drop_table :users rescue nil
  create_table :users do |t|
    t.string  :name
    t.integer :work_experience
    t.date    :dob
    t.text    :about
    t.text    :personal_statement
  end
end

