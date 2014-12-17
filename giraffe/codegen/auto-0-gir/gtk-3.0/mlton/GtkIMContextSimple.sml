structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class_t = 'a GtkIMContextSimpleClass.t =
  struct
    val getType_ = _import "gtk_im_context_simple_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_im_context_simple_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkIMContextSimpleClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.C.fromPtr true) new_ ()
  end
