signature GTK_ASPECT_FRAME_CLASS =
  sig
    type 'a aspect_frame
    type 'a frame_class
    include
      CLASS
        where type 'a class = 'a aspect_frame frame_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
