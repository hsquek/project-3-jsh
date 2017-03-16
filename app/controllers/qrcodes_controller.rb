require 'mqtt'
require 'rqrcode'

class QrcodesController < ApplicationController

  def show

    @qr_code = params[:id]
    @today = Date.today.strftime('%Y-%m-%d')
    puts @user_id = Booking.find_by(qr_code: @qr_code).user_id
    puts @user_email = User.find(@user_id).email

    @found = Booking.exists?(qr_code: @qr_code, booking_date: @today)
    if @found
      doMQTT
      flash[:notice] = "Welcome, remember to close gate after you."
      redirect_to root_path
    else
      flash[:alert] = "Access Denied"
      redirect_to root_path

    end
  end

  def sendqr
    puts @qrcode = params[:qr_code]

    puts @user_id = User.find(current_user.id)

    @today = Date.today.strftime('%Y-%m-%d')
    puts @user_email = User.find(@user_id).email

    @found = Booking.exists?(user_id: @user_id, qr_code: @qrcode)
    if @found
      makeQr('https://floating-ravine-65207.herokuapp.com/qrcodes/' + @qrcode)

      QrMailer.qrcode_email(@user_email).deliver
      flash[:notice] = "QR Code sent. Please check your email."
      redirect_to bookings_path

    end

  end

  # Publish
  def doMQTT
    MQTT::Client.connect(
      host: 'm13.cloudmqtt.com',
      username: 'fuggwrbm',
      password: '_ZF5kTtrv4eG',
      port: 26_770,
      ssl: true
    ) do |client|
      puts 'connected'
      client.publish('onoff', '1')
      client.disconnect
    end
  end

  def makeQr(theCode)
    qrcode = RQRCode::QRCode.new(theCode)
    # With default options specified explicitly
    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 250,
      border_modules: 4,
      module_px_size: 6,
      file: nil # path to write
    )
    # IO.write("./qrcode/qrcode.png", png.to_s)
    png.save('./qrcode/qrcode.png', interlace: true)
  end


end
