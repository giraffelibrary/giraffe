signature ATK_IMAGE_CLASS =
  sig
    type 'a image
    include
      CLASS
        where type 'a class = 'a image GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
