signature ATK_IMAGE_CLASS =
  sig
    type 'a image
    include
      CLASS
        where type 'a class = 'a image GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
