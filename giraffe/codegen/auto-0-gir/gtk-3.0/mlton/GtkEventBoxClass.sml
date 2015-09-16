structure GtkEventBoxClass :>
  GTK_EVENT_BOX_CLASS
    where type 'a bin_class_t = 'a GtkBinClass.t
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a event_box = unit
    type 'a bin_class_t = 'a GtkBinClass.t
    type 'a t = 'a event_box bin_class_t
    fun toBase obj = obj
    val t = GtkBinClass.t
    val tOpt = GtkBinClass.tOpt
    structure C = GtkBinClass.C
  end
