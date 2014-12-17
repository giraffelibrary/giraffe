signature VTE_PTY =
  sig
    type 'a class_t
    type ptyflags_t
    type t = base class_t
    val asInitable : 'a class_t -> base Gio.InitableClass.t
    val getType : unit -> GObject.Type.t
    val newForeignSync :
      LargeInt.int
       -> 'a Gio.CancellableClass.t option
       -> base class_t
    val newSync :
      ptyflags_t
       -> 'a Gio.CancellableClass.t option
       -> base class_t
    val childSetup : 'a class_t -> unit
    val close : 'a class_t -> unit
    val getFd : 'a class_t -> LargeInt.int
    val getSize : 'a class_t -> (LargeInt.int * LargeInt.int) option
    val setSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val setUtf8 :
      'a class_t
       -> bool
       -> bool
    val fdProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val flagsProp : ('a class_t, ptyflags_t, ptyflags_t) Property.readwrite
  end
