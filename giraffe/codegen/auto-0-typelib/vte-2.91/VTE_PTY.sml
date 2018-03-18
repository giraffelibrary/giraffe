signature VTE_PTY =
  sig
    type 'a class
    type pty_flags_t
    type t = base class
    val asInitable : 'a class -> base Gio.InitableClass.class
    val getType : unit -> GObject.Type.t
    val newForeignSync : LargeInt.int * 'a Gio.CancellableClass.class option -> base class
    val newSync : pty_flags_t * 'a Gio.CancellableClass.class option -> base class
    val childSetup : 'a class -> unit
    val close : 'a class -> unit
    val getFd : 'a class -> LargeInt.int
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setUtf8 :
      'a class
       -> bool
       -> unit
    val fdProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val flagsProp :
      {
        get : 'a class -> pty_flags_t,
        new : pty_flags_t -> 'a class Property.t
      }
  end
