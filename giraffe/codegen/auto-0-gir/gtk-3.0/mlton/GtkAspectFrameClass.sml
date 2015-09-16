structure GtkAspectFrameClass :>
  GTK_ASPECT_FRAME_CLASS
    where type 'a frame_class_t = 'a GtkFrameClass.t
    where type C.notnull = GtkFrameClass.C.notnull
    where type 'a C.p = 'a GtkFrameClass.C.p =
  struct
    type 'a aspect_frame = unit
    type 'a frame_class_t = 'a GtkFrameClass.t
    type 'a t = 'a aspect_frame frame_class_t
    fun toBase obj = obj
    val t = GtkFrameClass.t
    val tOpt = GtkFrameClass.tOpt
    structure C = GtkFrameClass.C
  end
