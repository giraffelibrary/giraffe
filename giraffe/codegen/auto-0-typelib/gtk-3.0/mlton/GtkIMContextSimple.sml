structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class = 'a GtkIMContextSimpleClass.class =
  struct
    val getType_ = _import "gtk_im_context_simple_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_im_context_simple_new" : unit -> GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p;
    val addComposeFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_im_context_simple_add_compose_file" :
              GtkIMContextSimpleClass.FFI.non_opt GtkIMContextSimpleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkIMContextSimpleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.FFI.fromPtr true) new_ ()
    fun addComposeFile self composeFile = (GtkIMContextSimpleClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addComposeFile_ (self & composeFile)
  end
