# frozen_string_literal: true

module RestaurantTablesHelper
  def create_qr(code)
    base = ENV["QR_DOMAIN"]
    path = "/home/register_table/"
    qrcode = RQRCode::QRCode.new("#{base}#{path}#{code}", :size => 6, :level => :h)
  end
end
