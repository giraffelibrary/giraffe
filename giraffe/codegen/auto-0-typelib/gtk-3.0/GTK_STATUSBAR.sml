signature GTK_STATUSBAR =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getContextId :
      'a class_t
       -> string
       -> LargeInt.int
    val getMessageArea : 'a class_t -> base widgetclass_t
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
