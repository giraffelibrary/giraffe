structure GtkTextChildAnchorClass :>
  GTK_TEXT_CHILD_ANCHOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a text_child_anchor = unit
    type 'a class = 'a text_child_anchor class
  end
