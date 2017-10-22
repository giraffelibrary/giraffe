structure GdkFrameClockClass :>
  GDK_FRAME_CLOCK_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a frame_clock = unit
    type 'a class = 'a frame_clock class
  end
