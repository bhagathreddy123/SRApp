class Batch < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy, :inverse_of => :batch
  belongs_to :admin
  accepts_nested_attributes_for :subjects, :allow_destroy => true, :reject_if=>:all_blank
  has_many :students_batches
  has_many :users, :through => :students_batches
  has_many :tests, :dependent => :destroy 
  validates :batch_name, :presence => true
  validates :batch_name, uniqueness: true
end
