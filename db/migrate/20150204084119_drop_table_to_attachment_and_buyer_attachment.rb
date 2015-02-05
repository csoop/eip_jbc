class DropTableToAttachmentAndBuyerAttachment < ActiveRecord::Migration
  def change
  	drop_table :attachments
  	drop_table :buyer_attachments
  end
end
