class Events::MotionClosedByUser < Event

  def self.publish!(motion, closer)
    create!(:kind => "motion_closed_by_user", :eventable => motion, :user => closer,
                      :discussion_id => motion.discussion.id)
  end

  def motion
    eventable
  end

end