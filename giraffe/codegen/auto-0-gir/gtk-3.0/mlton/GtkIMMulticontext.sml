structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class = 'a GtkIMMulticontextClass.class
    where type 'a menu_shell_class = 'a GtkMenuShellClass.class =
  struct
    val getType_ = _import "gtk_im_multicontext_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_im_multicontext_new" : unit -> GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p;
    val appendMenuitems_ = fn x1 & x2 => (_import "gtk_im_multicontext_append_menuitems" : GtkIMMulticontextClass.FFI.non_opt GtkIMMulticontextClass.FFI.p * GtkMenuShellClass.FFI.non_opt GtkMenuShellClass.FFI.p -> unit;) (x1, x2)
    val getContextId_ = _import "gtk_im_multicontext_get_context_id" : GtkIMMulticontextClass.FFI.non_opt GtkIMMulticontextClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val setContextId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_im_multicontext_set_context_id" :
              GtkIMMulticontextClass.FFI.non_opt GtkIMMulticontextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.FFI.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GtkIMMulticontextClass.FFI.withPtr &&&> GtkMenuShellClass.FFI.withPtr ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GtkIMMulticontextClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getContextId_ self
    fun setContextId self contextId = (GtkIMMulticontextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setContextId_ (self & contextId)
  end
