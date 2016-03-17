structure GtkSourceCompletionContextClass :>
  GTK_SOURCE_COMPLETION_CONTEXT_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    type 'a completion_context = unit
    type 'a class = 'a completion_context GObjectInitiallyUnownedClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectInitiallyUnownedClass.t
    val tOpt = GObjectInitiallyUnownedClass.tOpt
    structure C = GObjectInitiallyUnownedClass.C
  end
