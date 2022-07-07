module Persistable
  def create(item)
    collection << item
  end

  def all
    collection
  end

  private

  def collection
    @collection ||= []
  end
end