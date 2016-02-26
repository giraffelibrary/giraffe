structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class_t = 'a GtkIMMulticontextClass.t
    where type 'a menu_shell_class_t = 'a GtkMenuShellClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_multicontext_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_im_multicontext_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val appendMenuitems_ = call (load_sym libgtk "gtk_im_multicontext_append_menuitems") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getContextId_ = call (load_sym libgtk "gtk_im_multicontext_get_context_id") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setContextId_ = call (load_sym libgtk "gtk_im_multicontext_set_context_id") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkIMMulticontextClass.t
    type 'a menu_shell_class_t = 'a GtkMenuShellClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.C.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getContextId_ self
    fun setContextId self contextId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setContextId_ (self & contextId)
  end
