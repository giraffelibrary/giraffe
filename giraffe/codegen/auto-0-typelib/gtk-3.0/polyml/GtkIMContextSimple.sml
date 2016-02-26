structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class_t = 'a GtkIMContextSimpleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_context_simple_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_im_context_simple_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkIMContextSimpleClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.C.fromPtr true) new_ ()
  end
