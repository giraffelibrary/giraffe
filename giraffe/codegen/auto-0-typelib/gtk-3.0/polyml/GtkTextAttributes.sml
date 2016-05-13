structure GtkTextAttributes :>
  GTK_TEXT_ATTRIBUTES
    where type t = GtkTextAttributesRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_attributes_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_attributes_new") (PolyMLFFI.cVoid --> GtkTextAttributesRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_text_attributes_copy") (GtkTextAttributesRecord.PolyML.cPtr --> GtkTextAttributesRecord.PolyML.cPtr)
      val copyValues_ = call (load_sym libgtk "gtk_text_attributes_copy_values") (GtkTextAttributesRecord.PolyML.cPtr &&> GtkTextAttributesRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type t = GtkTextAttributesRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextAttributesRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkTextAttributesRecord.C.withPtr ---> GtkTextAttributesRecord.C.fromPtr true) copy_ self
    fun copyValues self dest = (GtkTextAttributesRecord.C.withPtr &&&> GtkTextAttributesRecord.C.withPtr ---> I) copyValues_ (self & dest)
  end
