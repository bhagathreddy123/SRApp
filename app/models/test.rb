class Test < ActiveRecord::Base
attr_accessor :new
  belongs_to :user
  belongs_to :batch
  belongs_to :subject
  has_many :mark_reports,:dependent => :destroy

end

