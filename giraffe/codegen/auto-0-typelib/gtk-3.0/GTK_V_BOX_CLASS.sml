signature GTK_V_BOX_CLASS =
  sig
    type 'a v_box
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a v_box box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
