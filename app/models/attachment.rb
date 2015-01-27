class Attachment < ActiveRecord::Base
	
	mount_uploader :attachment, AttachmentUploader

	belongs_to :attachmentable, :polymorphic => true

	validates :attachmentable, :attachment, :presence => true

	before_save :set_attachment_attributes

	protected

	def set_attachment_attributes
		if attachement.present? && attachment_changed?
			self.content_type = attachment.file.content_type
			self.file_name = attachment.file.filename
		end
	end
end
