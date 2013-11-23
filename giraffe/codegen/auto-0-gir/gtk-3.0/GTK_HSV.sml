signature GTK_HSV =
  sig
    type 'a class_t
    type directiontype_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val toRgb :
      real
       -> real
       -> real
       -> real
           * real
           * real
    val getColor :
      'a class_t
       -> real
           * real
           * real
    val getMetrics : 'a class_t -> LargeInt.int * LargeInt.int
    val isAdjusting : 'a class_t -> bool
    val setColor :
      'a class_t
       -> real
       -> real
       -> real
       -> unit
    val setMetrics :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveSig : (directiontype_t -> unit) -> 'a class_t Signal.signal
  end
