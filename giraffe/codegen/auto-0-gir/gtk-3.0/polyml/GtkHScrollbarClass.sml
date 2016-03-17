structure GtkHScrollbarClass :>
  GTK_H_SCROLLBAR_CLASS
    where type 'a scrollbar_class = 'a GtkScrollbarClass.class
    where type C.notnull = GtkScrollbarClass.C.notnull
    where type 'a C.p = 'a GtkScrollbarClass.C.p =
  struct
    type 'a h_scrollbar = unit
    type 'a scrollbar_class = 'a GtkScrollbarClass.class
    type 'a class = 'a h_scrollbar scrollbar_class
    type t = base class
    fun toBase obj = obj
    val t = GtkScrollbarClass.t
    val tOpt = GtkScrollbarClass.tOpt
    structure C = GtkScrollbarClass.C
  end
