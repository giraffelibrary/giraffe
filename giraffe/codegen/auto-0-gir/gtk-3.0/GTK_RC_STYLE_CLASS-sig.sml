signature GTK_RC_STYLE_CLASS =
  sig
    type 'a rc_style
    include
      CLASS
        where type 'a class = 'a rc_style GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
