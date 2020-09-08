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
    val modalProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val transientForProp : ('a class, unit -> base window_class option, 'b window_class option -> unit, 'b window_class option -> unit) Property.t
    val visibleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
