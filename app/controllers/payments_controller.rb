class PaymentsController < ApplicationController
  
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @payment = Payment.new
  end
    
  def create
    @payment = Payment.new(params[:payment])
    @payment.invoice_id = params[:invoice_id]

      if @payment.save
        redirect_to invoices_path, notice: 'Payment was posted.' 
      else
        render :new
      end
  end
  
  def show
    @invoice = Invoice.find(params[:invoice_id])
    @payments = @invoice.payments  
  end
  
  def edit
    @payment = Payment.find(params[:invoice_id])
  end
  
  def update
    invoice = Invoice.find(params[:id])
    @payment = Payment.find(params[:invoice_id])
    if @payment.update_attributes(params[:payment])
      redirect_to invoice_payment_path(invoice), notice: 'Payment was successfully updated.'
    else
      render :edit
    end   
  end

end