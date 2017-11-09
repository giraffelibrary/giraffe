signature GTK_V_SCALE_CLASS =
  sig
    type 'a v_scale
    type 'a scale_class
    include
      CLASS
        where type 'a class = 'a v_scale scale_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
