signature ATK_TEXT_CLASS =
  sig
    type 'a text
    include
      CLASS
        where type 'a class = 'a text GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
