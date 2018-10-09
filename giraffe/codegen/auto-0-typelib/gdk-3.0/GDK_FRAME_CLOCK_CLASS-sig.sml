signature GDK_FRAME_CLOCK_CLASS =
  sig
    type 'a frame_clock
    include
      CLASS
        where type 'a class = 'a frame_clock GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
