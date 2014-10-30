class CreateGetYelpResults < ActiveRecord::Migration
  def change
    create_table :get_yelp_results do |t|
      t.string :query
    end
  end  
end  