structure GtkFrameClass :>
  GTK_FRAME_CLASS
    where type 'a bin_class = 'a GtkBinClass.class
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a frame = unit
    type 'a bin_class = 'a GtkBinClass.class
    type 'a class = 'a frame bin_class
    type t = base class
    fun toBase obj = obj
    val t = GtkBinClass.t
    val tOpt = GtkBinClass.tOpt
    structure C = GtkBinClass.C
  end
