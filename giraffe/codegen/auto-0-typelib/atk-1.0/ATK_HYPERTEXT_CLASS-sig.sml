signature ATK_HYPERTEXT_CLASS =
  sig
    type 'a hypertext
    include
      CLASS
        where type 'a class = 'a hypertext GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
