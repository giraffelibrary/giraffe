signature GIO_CHARSET_CONVERTER =
  sig
    type 'a class
    type 'a converter_class
    type 'a initable_class
    type t = base class
    val asConverter : 'a class -> base converter_class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val new : string * string -> base class
    val getNumFallbacks : 'a class -> LargeInt.int
    val getUseFallback : 'a class -> bool
    val setUseFallback :
      'a class
       -> bool
       -> unit
    val fromCharsetProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val toCharsetProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val useFallbackProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
