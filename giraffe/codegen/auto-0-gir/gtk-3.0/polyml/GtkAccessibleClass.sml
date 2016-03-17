structure GtkAccessibleClass :>
  GTK_ACCESSIBLE_CLASS
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a accessible = unit
    type 'a class = 'a accessible AtkObjectClass.class
    type t = base class
    fun toBase obj = obj
    val t = AtkObjectClass.t
    val tOpt = AtkObjectClass.tOpt
    structure C = AtkObjectClass.C
  end
