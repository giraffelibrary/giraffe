signature GIO_CHARSET_CONVERTER =
  sig
    type 'a class
    type 'a converter_class
    type 'a initable_class
    type t = base class
    val asConverter : 'a class -> base converter_class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string
       -> base class
    val getNumFallbacks : 'a class -> LargeInt.int
    val getUseFallback : 'a class -> bool
    val setUseFallback :
      'a class
       -> bool
       -> unit
    val fromCharsetProp : ('a class, string option, string option) Property.readwrite
    val toCharsetProp : ('a class, string option, string option) Property.readwrite
    val useFallbackProp : ('a class, bool, bool) Property.readwrite
  end
