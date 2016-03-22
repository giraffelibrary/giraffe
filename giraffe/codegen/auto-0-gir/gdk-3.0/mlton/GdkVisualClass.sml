structure GdkVisualClass :>
  GDK_VISUAL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a visual = unit
    type 'a class = 'a visual class
  end
