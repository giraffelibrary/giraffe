structure GtkNumerableIconClass :>
  GTK_NUMERABLE_ICON_CLASS
    where type C.notnull = GioEmblemedIconClass.C.notnull
    where type 'a C.p = 'a GioEmblemedIconClass.C.p =
  struct
    type 'a numerable_icon = unit
    type 'a t = 'a numerable_icon GioEmblemedIconClass.t
    fun toBase obj = obj
    val t = GioEmblemedIconClass.t
    val tOpt = GioEmblemedIconClass.tOpt
    structure C = GioEmblemedIconClass.C
  end
