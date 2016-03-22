signature GTK_V_PANED_CLASS =
  sig
    type 'a v_paned
    type 'a paned_class
    include
      CLASS
        where type 'a class = 'a v_paned paned_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
