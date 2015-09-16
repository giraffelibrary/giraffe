signature GIO_CHARSET_CONVERTER =
  sig
    type 'a class_t
    type 'a converter_class_t
    type 'a initable_class_t
    type t = base class_t
    val asConverter : 'a class_t -> base converter_class_t
    val asInitable : 'a class_t -> base initable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string
       -> base class_t
    val getNumFallbacks : 'a class_t -> LargeInt.int
    val getUseFallback : 'a class_t -> bool
    val setUseFallback :
      'a class_t
       -> bool
       -> unit
    val fromCharsetProp : ('a class_t, string option, string option) Property.readwrite
    val toCharsetProp : ('a class_t, string option, string option) Property.readwrite
    val useFallbackProp : ('a class_t, bool, bool) Property.readwrite
  end
