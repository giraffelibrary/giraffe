structure GtkIMContextSimple :>
  GTK_I_M_CONTEXT_SIMPLE
    where type 'a class = 'a GtkIMContextSimpleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_context_simple_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_im_context_simple_new") (PolyMLFFI.cVoid --> GtkIMContextClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkIMContextSimpleClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMContextSimpleClass.C.fromPtr true) new_ ()
  end
