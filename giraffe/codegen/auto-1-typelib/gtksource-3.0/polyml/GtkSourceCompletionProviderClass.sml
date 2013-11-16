structure GtkSourceCompletionProviderClass :>
  GTK_SOURCE_COMPLETION_PROVIDER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a completionprovider = unit
    type 'a t = 'a completionprovider GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
