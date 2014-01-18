structure GtkHandleBoxClass :>
  GTK_HANDLE_BOX_CLASS
    where type 'a binclass_t = 'a GtkBinClass.t
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a handlebox = unit
    type 'a binclass_t = 'a GtkBinClass.t
    type 'a t = 'a handlebox binclass_t
    fun toBase obj = obj
    val t = GtkBinClass.t
    val tOpt = GtkBinClass.tOpt
    structure C = GtkBinClass.C
  end