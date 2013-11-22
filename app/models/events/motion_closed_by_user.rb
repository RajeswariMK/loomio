class Events::MotionClosedByUser < Event
  after_create :notify_users!

  def self.publish!(motion, closer)
    create!(:kind => "motion_closed_by_user", :eventable => motion, :user => closer,
                      :discussion_id => motion.discussion.id)
  end

  def motion
    eventable
  end

  def notify_users!
    motion.group_users_without_motion_author.each do |user|
      notify!(user)
    end
  end

  handle_asynchronously :notify_users!
end