signature GTK_STATUSBAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getContextId :
      'a class
       -> string
       -> LargeInt.int
    val getMessageArea : 'a class -> base widget_class
    val pop :
      'a class
       -> LargeInt.int
       -> unit
    val push :
      'a class
       -> LargeInt.int * string
       -> LargeInt.int
    val remove :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val removeAll :
      'a class
       -> LargeInt.int
       -> unit
    val textPoppedSig : (LargeInt.int * string -> unit) -> 'a class Signal.signal
    val textPushedSig : (LargeInt.int * string -> unit) -> 'a class Signal.signal
  end
