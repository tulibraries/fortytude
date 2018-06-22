class RemoveSpaceIdFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_reference :people, :space, foreign_key: true
  end
end
