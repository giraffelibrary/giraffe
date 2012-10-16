signature GTK_BUILDER =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addFromFile :
      'a class_t
       -> string
       -> LargeInt.int
    val addFromString :
      'a class_t
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val connectSignals : 'a class_t -> unit
    val getObject :
      'a class_t
       -> string
       -> base GObject.ObjectClass.t
    val getTranslationDomain : 'a class_t -> string
    val setTranslationDomain :
      'a class_t
       -> string option
       -> unit
    val valueFromString :
      'a class_t
       -> 'b GObject.ParamSpecClass.t
       -> string
       -> GObject.ValueRecord.t option
    val translationDomainProp : ('a class_t, string option, string option) Property.readwrite
  end
