class AddTotalToInvoiceTable < ActiveRecord::Migration
  def change
    add_column :invoices, :total, :decimal
  end
end
