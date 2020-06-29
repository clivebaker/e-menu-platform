# Preview all emails at http://localhost:3000/rails/mailers/receipt
class ReceiptPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt/send
  def send
    ReceiptMailer.send
  end

end
