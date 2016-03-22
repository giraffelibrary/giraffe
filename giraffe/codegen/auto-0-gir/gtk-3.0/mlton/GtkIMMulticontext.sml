structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class = 'a GtkIMMulticontextClass.class
    where type 'a menu_shell_class = 'a GtkMenuShellClass.class =
  struct
    val getType_ = _import "gtk_im_multicontext_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_im_multicontext_new" : unit -> GtkIMContextClass.C.notnull GtkIMContextClass.C.p;
    val appendMenuitems_ = fn x1 & x2 => (_import "gtk_im_multicontext_append_menuitems" : GtkIMMulticontextClass.C.notnull GtkIMMulticontextClass.C.p * GtkMenuShellClass.C.notnull GtkMenuShellClass.C.p -> unit;) (x1, x2)
    val getContextId_ = _import "gtk_im_multicontext_get_context_id" : GtkIMMulticontextClass.C.notnull GtkIMMulticontextClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setContextId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_im_multicontext_set_context_id" :
              GtkIMMulticontextClass.C.notnull GtkIMMulticontextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkIMMulticontextClass.class
    type 'a menu_shell_class = 'a GtkMenuShellClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.C.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GtkIMMulticontextClass.C.withPtr &&&> GtkMenuShellClass.C.withPtr ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GtkIMMulticontextClass.C.withPtr ---> Utf8.C.fromPtr false) getContextId_ self
    fun setContextId self contextId = (GtkIMMulticontextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setContextId_ (self & contextId)
  end
