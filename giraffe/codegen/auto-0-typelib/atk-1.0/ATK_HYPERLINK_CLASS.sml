signature ATK_HYPERLINK_CLASS =
  sig
    type 'a hyperlink
    include
      CLASS
        where type 'a class = 'a hyperlink GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
