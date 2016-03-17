structure GtkFileFilterClass :>
  GTK_FILE_FILTER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    type 'a file_filter = unit
    type 'a class = 'a file_filter GObjectInitiallyUnownedClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectInitiallyUnownedClass.t
    val tOpt = GObjectInitiallyUnownedClass.tOpt
    structure C = GObjectInitiallyUnownedClass.C
  end
