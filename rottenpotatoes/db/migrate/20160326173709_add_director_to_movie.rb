# ran this line to create this file: rails generate migration add_director_to_movie director:string
class AddDirectorToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string
  end
end
