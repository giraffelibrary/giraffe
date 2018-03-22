signature GTK_V_SCROLLBAR_CLASS =
  sig
    type 'a v_scrollbar
    type 'a scrollbar_class
    include
      CLASS
        where type 'a class = 'a v_scrollbar scrollbar_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
