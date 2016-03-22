structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class = 'a GtkIMMulticontextClass.class
    where type 'a menu_shell_class = 'a GtkMenuShellClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_multicontext_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_im_multicontext_new") (FFI.PolyML.cVoid --> GtkIMContextClass.PolyML.cPtr)
      val appendMenuitems_ = call (load_sym libgtk "gtk_im_multicontext_append_menuitems") (GtkIMMulticontextClass.PolyML.cPtr &&> GtkMenuShellClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getContextId_ = call (load_sym libgtk "gtk_im_multicontext_get_context_id") (GtkIMMulticontextClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setContextId_ = call (load_sym libgtk "gtk_im_multicontext_set_context_id") (GtkIMMulticontextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkIMMulticontextClass.class
    type 'a menu_shell_class = 'a GtkMenuShellClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.C.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GtkIMMulticontextClass.C.withPtr &&&> GtkMenuShellClass.C.withPtr ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GtkIMMulticontextClass.C.withPtr ---> Utf8.C.fromPtr false) getContextId_ self
    fun setContextId self contextId = (GtkIMMulticontextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setContextId_ (self & contextId)
  end
