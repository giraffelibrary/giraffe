signature GTK_BUILDER =
  sig
    type 'a class
    type 'a application_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromFile : string -> base class
    val newFromResource : string -> base class
    val newFromString : string * LargeInt.int -> base class
    val addFromFile :
      'a class
       -> string
       -> LargeInt.int
    val addFromResource :
      'a class
       -> string
       -> LargeInt.int
    val addFromString :
      'a class
       -> string * LargeInt.int
       -> LargeInt.int
    val addObjectsFromFile :
      'a class
       -> string * string list
       -> LargeInt.int
    val addObjectsFromResource :
      'a class
       -> string * string list
       -> LargeInt.int
    val addObjectsFromString :
      'a class
       -> string
           * LargeInt.int
           * string list
       -> LargeInt.int
    val exposeObject :
      'a class
       -> string * 'b GObject.ObjectClass.class
       -> unit
    val getApplication : 'a class -> base application_class
    val getObject :
      'a class
       -> string
       -> base GObject.ObjectClass.class
    val getTranslationDomain : 'a class -> string
    val setApplication :
      'a class
       -> 'b application_class
       -> unit
    val setTranslationDomain :
      'a class
       -> string option
       -> unit
    val valueFromString :
      'a class
       -> 'b GObject.ParamSpecClass.class * string
       -> GObject.ValueRecord.t
    val translationDomainProp : ('a class, string option, string option) Property.readwrite
  end
