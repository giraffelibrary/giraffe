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
    val getSize : 'a class -> (LargeInt.int * LargeInt.int) option
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> bool
    val setTerm :
      'a class
       -> string option
       -> unit
    val setUtf8 :
      'a class
       -> bool
       -> bool
    val fdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val flagsProp : ('a class, pty_flags_t, pty_flags_t) Property.readwrite
    val termProp : ('a class, string option, string option) Property.readwrite
  end
