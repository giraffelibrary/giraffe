signature VTE_PTY =
  sig
    type 'a class
    type pty_flags_t
    type t = base class
    val asInitable : 'a class -> base Gio.InitableClass.class
    val getType : unit -> GObject.Type.t
    val new : pty_flags_t -> base class
    val newForeign : LargeInt.int -> base class
    val childSetup : 'a class -> unit
    val close : 'a class -> unit
    val getFd : 'a class -> LargeInt.int
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setTerm :
      'a class
       -> string option
       -> unit
    val setUtf8 :
      'a class
       -> bool
       -> unit
    val fdProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
    val flagsProp : ('a class, unit -> pty_flags_t, unit, pty_flags_t -> unit) Property.t
    val termProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
