class EmailsController < ApplicationController
  include EmailsHelper
  
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @email = Email.new
    @email.subject = email_subject(@invoice)
    @email.message = email_message(@invoice)
  end
  
  def create
    @invoice = Invoice.find(params[:invoice_id])
    @email = Email.new(params[:email])
    @email.invoice_id = params[:invoice_id]

      if @email.save
        InvoiceMailer.send_invoice(@invoice, @email, current_user).deliver
        redirect_to invoice_path(@email.invoice_id), notice: 'Email was posted.' 
      else
        render :new
      end
  end

end