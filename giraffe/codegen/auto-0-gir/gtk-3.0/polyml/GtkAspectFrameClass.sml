structure GtkAspectFrameClass :>
  GTK_ASPECT_FRAME_CLASS
    where type 'a frameclass_t = 'a GtkFrameClass.t
    where type C.notnull = GtkFrameClass.C.notnull
    where type 'a C.p = 'a GtkFrameClass.C.p =
  struct
    type 'a aspectframe = unit
    type 'a frameclass_t = 'a GtkFrameClass.t
    type 'a t = 'a aspectframe frameclass_t
    fun toBase obj = obj
    val t = GtkFrameClass.t
    val tOpt = GtkFrameClass.tOpt
    structure C = GtkFrameClass.C
  end
