

class QrMailer < ApplicationMailer
  default from: 'admin@jsh.com'

def qrcode_email(user)

  @user = user
   attachments.inline['qrcode.png'] = File.read('./qrcode/qrcode.png')
   # attachments['qrcode'] = File.read("/qrcode/qrcode.png")
  mail(to: @user, subject: 'Your access key')

end


end
