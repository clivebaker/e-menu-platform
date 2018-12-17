# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@e-me.nu'
  layout 'mailer'
end
