class Subject < ActiveRecord::Base
  belongs_to :batch
  has_many :students_batches
  belongs_to :admin
  has_many :users 
  has_many :tests, :dependent => :destroy
  validates :subject_name, :presence => true, :if => 'batch.present?'
end
