structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class_t = 'a GtkIMContextSimpleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_context_simple_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_im_context_simple_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkIMContextSimpleClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.C.fromPtr true) new_ ()
  end
