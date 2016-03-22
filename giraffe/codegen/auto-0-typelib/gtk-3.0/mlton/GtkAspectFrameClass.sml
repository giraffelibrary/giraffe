structure GtkAspectFrameClass :>
  GTK_ASPECT_FRAME_CLASS
    where type 'a frame_class = 'a GtkFrameClass.class
    where type C.notnull = GtkFrameClass.C.notnull
    where type 'a C.p = 'a GtkFrameClass.C.p =
  struct
    type 'a frame_class = 'a GtkFrameClass.class
    open GtkFrameClass
    type 'a aspect_frame = unit
    type 'a class = 'a aspect_frame class
  end
