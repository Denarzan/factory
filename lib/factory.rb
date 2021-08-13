# * Here you must define your `Factory` class.
# * Each instance of Factory could be stored into variable. The name of this variable is the name of created Class
# * Arguments of creatable Factory instance are fields/attributes of created class
# * The ability to add some methods to this class must be provided while creating a Factory
# * We must have an ability to get/set the value of attribute like [0], ['attribute_name'], [:attribute_name]
#
# * Instance of creatable Factory class should correctly respond to main methods of Struct
# - each
# - each_pair
# - dig
# - size/length
# - members
# - select
# - to_a
# - values_at
# - ==, eql?
class Factory

  def self.new(class_name, *args, &block)
    if class_name.is_a? String
      const_set(class_name, Struct.new(*args) { class_eval(&block) if block_given? })
    else
      Struct.new(*args.unshift(class_name)) { class_eval(&block) if block_given? }
    end
  end
end
