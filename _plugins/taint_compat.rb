# Liquid 4.0.3 calls tainted? which was removed in Ruby 3.2+.
# This shim restores it as a no-op for compatibility.
return if String.method_defined?(:tainted?)

[String, Integer, Float, Array, Hash, Symbol, NilClass, TrueClass, FalseClass].each do |klass|
  klass.define_method(:tainted?) { false }
end
