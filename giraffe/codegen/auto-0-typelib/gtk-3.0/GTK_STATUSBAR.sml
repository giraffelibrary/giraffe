signature GTK_STATUSBAR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getContextId :
      'a class_t
       -> string
       -> LargeInt.int
    val getMessageArea : 'a class_t -> base widget_class_t
    val pop :
      'a class_t
       -> LargeInt.int
       -> unit
    val push :
      'a class_t
       -> LargeInt.int
       -> string
       -> LargeInt.int
    val remove :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val removeAll :
      'a class_t
       -> LargeInt.int
       -> unit
    val textPoppedSig :
      (LargeInt.int
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val textPushedSig :
      (LargeInt.int
        -> string
        -> unit)
       -> 'a class_t Signal.signal
  end
