signature GTK_H_PANED_CLASS =
  sig
    type 'a h_paned
    type 'a paned_class
    include
      CLASS
        where type 'a class = 'a h_paned paned_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
