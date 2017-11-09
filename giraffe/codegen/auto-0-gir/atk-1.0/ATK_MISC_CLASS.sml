signature ATK_MISC_CLASS =
  sig
    type 'a misc
    include
      CLASS
        where type 'a class = 'a misc GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
