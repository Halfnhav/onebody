class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
  
  belongs_to :verse,  :foreign_key => 'taggable_id'
  belongs_to :recipe, :foreign_key => 'taggable_id'
  
  def after_destroy
    if Tag.destroy_unused
      if tag.taggings.count.zero?
        tag.destroy
      end
    end
  end
end