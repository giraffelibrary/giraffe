structure GtkApplicationClass :>
  GTK_APPLICATION_CLASS
    where type C.notnull = GioApplicationClass.C.notnull
    where type 'a C.p = 'a GioApplicationClass.C.p =
  struct
    type 'a application = unit
    type 'a t = 'a application GioApplicationClass.t
    fun toBase obj = obj
    val t = GioApplicationClass.t
    val tOpt = GioApplicationClass.tOpt
    structure C = GioApplicationClass.C
  end
