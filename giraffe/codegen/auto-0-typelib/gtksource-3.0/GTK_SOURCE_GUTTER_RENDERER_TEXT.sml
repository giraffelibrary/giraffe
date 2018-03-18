signature GTK_SOURCE_GUTTER_RENDERER_TEXT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val measure :
      'a class
       -> string
       -> LargeInt.int * LargeInt.int
    val measureMarkup :
      'a class
       -> string
       -> LargeInt.int * LargeInt.int
    val setMarkup :
      'a class
       -> string * LargeInt.int
       -> unit
    val setText :
      'a class
       -> string * LargeInt.int
       -> unit
    val markupProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
