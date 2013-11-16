signature GIO_CHARSET_CONVERTER =
  sig
    type 'a class_t
    type 'a initableclass_t
    type 'a converterclass_t
    val asConverter : 'a class_t -> base converterclass_t
    val asInitable : 'a class_t -> base initableclass_t
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
