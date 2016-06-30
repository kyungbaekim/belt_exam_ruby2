class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joined_members, through: :members
  validates :name, presence: true, uniqueness: { :case_sensitive => false }, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }

  def member_count
    members = Member.where(group_id: self.id)
    count = members.count
  end

  def is_member?(user_id)
    members = Member.where(group_id: self.id)
    members.each do |m|
      if m.user_id == user_id
        return true;
      end
    end
    return false;
  end
end
