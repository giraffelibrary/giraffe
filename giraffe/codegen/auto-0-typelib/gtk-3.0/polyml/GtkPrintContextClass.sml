structure GtkPrintContextClass :>
  GTK_PRINT_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a print_context = unit
    type 'a class = 'a print_context GObjectObjectClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
