signature GTK_IMAGE_CLASS =
  sig
    type 'a image
    type 'a misc_class
    include
      CLASS
        where type 'a class = 'a image misc_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
