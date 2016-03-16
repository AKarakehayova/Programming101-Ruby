#instance_eval

class Object
  def singleton_class
    class << Object
      self
    end
  end
end

class Object
  def define_singleton_method(name, &block)
    self.send :define_method, name, &block
  end
end

class String
  def to_proc
    proc {|n| n.public_send self}
  end
end

class Symbol
  def to_proc
    proc {|arg, *args| arg.public_send(self, *args)}
  end
end

class Module
  def private_attr_accessor(*names)
    names.each do |name|
      define_method(name) {instance_variable_get ("@#{name}")}
      define_method("#{name}=") {|arg| instance_variable_set("@#{name}, arg")}
      private name, "#{name}="
    end
  end
end

class Module
  def cattr_accessor(*names)
    names.each do |name|
      define_method(name) {class_variable_get("@#{name}")}
      define_method("#{name}=") {|arg| class_variable_set("@#{name}, arg")}
    end
  end
end

class NilClass
  def method_missing
    nil
  end
end

class Proxy < BasicObject
  def initialize obj
    @obj = obj
  end

  def method_missing(method, *args, &block)
    if @obj.respond_to?(method)
      @obj.send(method, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    @obj.respond_to? method, include_private
  end
end


module Delegate
  def delegate (method, to:)
    define_method(method) {instance_eval "#{to}.send(method)"}
  end

  #def delegate(name, to:)
   # class_eval <<-RUBY
   # def #{name} (*a, **kw, &block)
   #   #{to}.#{name}(*a, **kw,&block)
   # end
   # RUBY
  #end
end


 User = Struct.new(:first_name, :last_name)

class Invoce
  extend Delegate
  delegate :first_name, to: '@user'
  delegate :last_name, to: '@user'

  def initialize(user)
    @user = user
  end
end

#user = User.new 'Genadi', 'Samokovarov'
#invoice = Invoce.new(user)

#invoice.first_name #=> "Genadi"
#invoice.last_name #=> "Samokovarov"


class Object
  def blank?
    if self.empty?
      true
    elsif self.class == String
      self.delete(" ").empty?
    else false
    end
  end

  def present?
    not(self.blank?)
  end

  def presence
    if self.present?
      self
    else nil
    end
  end

  def try(method=nil, &block)
    if method.nil?
      block.call(self)
    elsif self.nil?
      nil
    else send method
    end
  end
end

class StringInquirer
  def initialize(name)
    @name = name
  end

  def method_missing(name)
    name = name.to_s
    return super if name.chars.last != "?"
    name.chop!
    @name = name
  end
end

class String
  def inquiry
    StringInquirer.new(self)
  end
end


