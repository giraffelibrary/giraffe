signature GTK_HSV =
  sig
    type 'a class
    type 'a buildable_class
    type direction_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val toRgb :
      real
       * real
       * real
       -> real
           * real
           * real
    val getColor :
      'a class
       -> real
           * real
           * real
    val getMetrics : 'a class -> LargeInt.int * LargeInt.int
    val isAdjusting : 'a class -> bool
    val setColor :
      'a class
       -> real
           * real
           * real
       -> unit
    val setMetrics :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.signal
    val moveSig : (direction_type_t -> unit) -> 'a class Signal.signal
  end
