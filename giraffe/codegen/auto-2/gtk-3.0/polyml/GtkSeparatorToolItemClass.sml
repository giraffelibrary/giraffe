structure GtkSeparatorToolItemClass :>
  GTK_SEPARATOR_TOOL_ITEM_CLASS
    where type 'a toolitemclass_t = 'a GtkToolItemClass.t
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a separatortoolitem = unit
    type 'a toolitemclass_t = 'a GtkToolItemClass.t
    type 'a t = 'a separatortoolitem toolitemclass_t
    fun toBase obj = obj
    val t = GtkToolItemClass.t
    val tOpt = GtkToolItemClass.tOpt
    structure C = GtkToolItemClass.C
  end
