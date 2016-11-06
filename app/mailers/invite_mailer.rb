class InviteMailer < ApplicationMailer

  def send_invite invite
    @invite = invite
    @for_text = case invite.invite_kind
      when 'for_parent'
        'parent'
      when 'for_guardian'
        'guardian'
      end
    mail to: invite.email, subject: "Invite to become #{@for_text}"
  end

end
