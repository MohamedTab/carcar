class AddAttachmentPictureToLearners < ActiveRecord::Migration
  def self.up
    change_table :learners do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :learners, :picture
  end
end
