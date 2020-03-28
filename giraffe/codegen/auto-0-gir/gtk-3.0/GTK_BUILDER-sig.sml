signature GTK_BUILDER =
  sig
    type 'a class
    type 'a widget_class
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
       -> string * Utf8CArray.t
       -> LargeInt.int
    val addObjectsFromResource :
      'a class
       -> string * Utf8CArray.t
       -> LargeInt.int
    val addObjectsFromString :
      'a class
       -> string
           * LargeInt.int
           * Utf8CArray.t
       -> LargeInt.int
    val exposeObject :
      'a class
       -> string * 'b GObject.ObjectClass.class
       -> unit
    val extendWithTemplate :
      'a class
       -> 'b widget_class
           * GObject.Type.t
           * string
           * LargeInt.int
       -> LargeInt.int
    val getApplication : 'a class -> base application_class option
    val getObject :
      'a class
       -> string
       -> base GObject.ObjectClass.class option
    val getTranslationDomain : 'a class -> string
    val getTypeFromName :
      'a class
       -> string
       -> GObject.Type.t
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
    val valueFromStringType :
      'a class
       -> GObject.Type.t * string
       -> GObject.ValueRecord.t
    val translationDomainProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
