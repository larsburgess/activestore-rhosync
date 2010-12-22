require 'active_resource'
class ActiveProduct < ActiveResource::Base
  self.site = "http://rhostore.heroku.com"
  self.element_name = "product"
end

class Product < SourceAdapter
  
  def initialize(source,credential)
    super(source,credential)
  end
 
  def query(params=nil)
    @result = {}
    products = ActiveProduct.find(:all)
    products.each do |product|
      @result[product.id.to_s] = JSON.parse(product.to_json)['product']
    end
  end
 
  def create(create_hash)
    product = ActiveProduct.create(create_hash)
    product.id.to_s #=> return the new product id so a link can be made
  end
 
  def update(update_hash)
    obj_id = update_hash['id']
    update_hash.delete('id')
    product = ActiveProduct.find(obj_id.to_i)
    product.update_attributes(update_hash)
  end
 
  def delete(object_id)
    product = ActiveProduct.find(object_id['id'].to_i)
    product.destroy
  end
end