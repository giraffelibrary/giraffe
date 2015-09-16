structure GtkHScrollbarClass :>
  GTK_H_SCROLLBAR_CLASS
    where type 'a scrollbar_class_t = 'a GtkScrollbarClass.t
    where type C.notnull = GtkScrollbarClass.C.notnull
    where type 'a C.p = 'a GtkScrollbarClass.C.p =
  struct
    type 'a h_scrollbar = unit
    type 'a scrollbar_class_t = 'a GtkScrollbarClass.t
    type 'a t = 'a h_scrollbar scrollbar_class_t
    fun toBase obj = obj
    val t = GtkScrollbarClass.t
    val tOpt = GtkScrollbarClass.tOpt
    structure C = GtkScrollbarClass.C
  end
