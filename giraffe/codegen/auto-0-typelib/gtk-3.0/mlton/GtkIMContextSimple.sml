structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class = 'a GtkIMContextSimpleClass.class =
  struct
    val getType_ = _import "gtk_im_context_simple_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_im_context_simple_new" : unit -> GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p;
    type 'a class = 'a GtkIMContextSimpleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.FFI.fromPtr true) new_ ()
  end
