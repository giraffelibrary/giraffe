structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class = 'a GtkIMContextSimpleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_im_context_simple_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_im_context_simple_new") (cVoid --> GtkIMContextClass.PolyML.cPtr)
      val addComposeFile_ = call (getSymbol "gtk_im_context_simple_add_compose_file") (GtkIMContextSimpleClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkIMContextSimpleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.FFI.fromPtr true) new_ ()
    fun addComposeFile self composeFile = (GtkIMContextSimpleClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addComposeFile_ (self & composeFile)
  end
