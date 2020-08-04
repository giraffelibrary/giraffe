structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class = 'a GtkIMMulticontextClass.class
    where type 'a menu_shell_class = 'a GtkMenuShellClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_im_multicontext_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_im_multicontext_new") (cVoid --> GtkIMContextClass.PolyML.cPtr)
      val appendMenuitems_ = call (getSymbol "gtk_im_multicontext_append_menuitems") (GtkIMMulticontextClass.PolyML.cPtr &&> GtkMenuShellClass.PolyML.cPtr --> cVoid)
      val getContextId_ = call (getSymbol "gtk_im_multicontext_get_context_id") (GtkIMMulticontextClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setContextId_ = call (getSymbol "gtk_im_multicontext_set_context_id") (GtkIMMulticontextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkIMMulticontextClass.class
    type 'a menu_shell_class = 'a GtkMenuShellClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.FFI.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GtkIMMulticontextClass.FFI.withPtr false &&&> GtkMenuShellClass.FFI.withPtr false ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GtkIMMulticontextClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getContextId_ self
    fun setContextId self contextId = (GtkIMMulticontextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setContextId_ (self & contextId)
  end
