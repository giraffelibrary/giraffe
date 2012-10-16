structure GtkVScrollbarClass :>
  GTK_V_SCROLLBAR_CLASS
    where type 'a scrollbarclass_t = 'a GtkScrollbarClass.t
    where type C.notnull = GtkScrollbarClass.C.notnull
    where type 'a C.p = 'a GtkScrollbarClass.C.p =
  struct
    type 'a vscrollbar = unit
    type 'a scrollbarclass_t = 'a GtkScrollbarClass.t
    type 'a t = 'a vscrollbar scrollbarclass_t
    fun toBase obj = obj
    val t = GtkScrollbarClass.t
    val tOpt = GtkScrollbarClass.tOpt
    structure C = GtkScrollbarClass.C
  end
