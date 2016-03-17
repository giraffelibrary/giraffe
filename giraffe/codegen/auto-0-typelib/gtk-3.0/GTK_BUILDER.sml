signature GTK_BUILDER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addFromFile :
      'a class
       -> string
       -> LargeInt.int
    val addFromString :
      'a class
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val getObject :
      'a class
       -> string
       -> base GObject.ObjectClass.class
    val getTranslationDomain : 'a class -> string
    val setTranslationDomain :
      'a class
       -> string option
       -> unit
    val valueFromString :
      'a class
       -> 'b GObject.ParamSpecClass.class
       -> string
       -> GObject.ValueRecord.t option
    val translationDomainProp : ('a class, string option, string option) Property.readwrite
  end
