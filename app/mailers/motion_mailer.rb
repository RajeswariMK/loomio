class MotionMailer < BaseMailer
  def new_motion_created(motion, user)
    @user = user
    @motion = motion
    @group = motion.group
    @rendered_motion_description = render_rich_text(motion.description, false) #should replace false with motion.uses_markdown in future
    locale = best_locale(user.language_preference, motion.author.language_preference)
    I18n.with_locale(locale) do
      mail  to: user.email,
            from: "#{motion.author.name} <noreply@loomio.org>",
            reply_to: motion.author_name_and_email,
            subject: "#{t(:proposal)}: #{@motion.name} - #{@group.name}"
    end
  end

  def motion_closed(motion, email)
    @motion = motion
    @group = motion.group
    locale = best_locale(User.find_by_email(email).language_preference, motion.author.language_preference)
    I18n.with_locale(locale) do
      mail  to: email,
            subject: t("email.proposal_closed.subject", which: @motion.name)
    end
  end

  def motion_blocked(vote)
    @vote = vote
    @user = vote.user
    @motion = vote.motion
    @discussion = @motion.discussion
    @group = @motion.group
    @rendered_motion_description = render_rich_text(@motion.description, false) #should replace false with motion.uses_markdown in future
    locale = best_locale(@motion.author.language_preference, nil)
    I18n.with_locale(locale) do
      mail  to: @motion.author_email,
            reply_to: @group.admin_email,
            subject: "#{email_subject_prefix(@group.full_name)} " + t("email.proposal_blocked.subject", which: @motion.name)
    end
  end

  def motion_outcome_created(motion, user)
    @user = user
    @motion = motion
    @group = motion.group
    @rendered_motion_description = render_rich_text(motion.description, false) #should replace false with motion.uses_markdown in future
    locale = best_locale(user.language_preference, motion.author.language_preference)
    I18n.with_locale(locale) do
      mail  to: user.email,
            from: "#{user.name} <noreply@loomio.org>",
            subject: "#{t("email.proposal_outcome.subject")}: #{@motion.name} - #{@group.name}"
    end
  end


end
