structure GtkTextAttributes :>
  GTK_TEXT_ATTRIBUTES
    where type record_t = GtkTextAttributesRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_attributes_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_text_attributes_new") (FFI.PolyML.VOID --> GtkTextAttributesRecord.PolyML.PTR)
      val copy_ = call (load_sym libgtk "gtk_text_attributes_copy") (GtkTextAttributesRecord.PolyML.PTR --> GtkTextAttributesRecord.PolyML.PTR)
      val copyValues_ = call (load_sym libgtk "gtk_text_attributes_copy_values") (GtkTextAttributesRecord.PolyML.PTR &&> GtkTextAttributesRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type record_t = GtkTextAttributesRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextAttributesRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkTextAttributesRecord.C.withPtr ---> GtkTextAttributesRecord.C.fromPtr true) copy_ self
    fun copyValues self dest = (GtkTextAttributesRecord.C.withPtr &&&> GtkTextAttributesRecord.C.withPtr ---> I) copyValues_ (self & dest)
  end
