structure GtkTextChildAnchorClass :>
  GTK_TEXT_CHILD_ANCHOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a text_child_anchor = unit
    type 'a t = 'a text_child_anchor GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
