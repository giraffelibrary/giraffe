signature GTK_NATIVE_DIALOG =
  sig
    type 'a class
    type 'a window_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val destroy : 'a class -> unit
    val getModal : 'a class -> bool
    val getTitle : 'a class -> string option
    val getTransientFor : 'a class -> base window_class option
    val getVisible : 'a class -> bool
    val hide : 'a class -> unit
    val run : 'a class -> LargeInt.int
    val setModal :
      'a class
       -> bool
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setTransientFor :
      'a class
       -> 'b window_class option
       -> unit
    val show : 'a class -> unit
    val responseSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val modalProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val titleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val transientForProp :
      {
        get : 'a class -> base window_class option,
        set :
          'b window_class option
           -> 'a class
           -> unit,
        new : 'b window_class option -> 'a class Property.t
      }
    val visibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
