class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :students_batches
  has_many :batches, :through => :students_batches
  belongs_to :admin
  belongs_to :subject 
  has_many :given_attendences, :class_name => "Attendance",:foreign_key => :user_id, :dependent => :destroy
  has_many :received_attendences, :class_name => "Attendance", :foreign_key => :receiver_id, :dependent => :destroy
end
