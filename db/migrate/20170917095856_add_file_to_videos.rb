class AddFileToVideos < ActiveRecord::Migration[5.1]
  def up
    add_attachment :videos, :file
  end

  def down
    remove_attachment :videos, :file
  end
end
