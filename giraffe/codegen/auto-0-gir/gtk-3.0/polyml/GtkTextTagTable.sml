structure GtkTextTagTable :>
  GTK_TEXT_TAG_TABLE
    where type 'a class = 'a GtkTextTagTableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a text_tag_class = 'a GtkTextTagClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_tag_table_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_tag_table_new") (FFI.PolyML.cVoid --> GtkTextTagTableClass.PolyML.cPtr)
      val add_ = call (load_sym libgtk "gtk_text_tag_table_add") (GtkTextTagTableClass.PolyML.cPtr &&> GtkTextTagClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getSize_ = call (load_sym libgtk "gtk_text_tag_table_get_size") (GtkTextTagTableClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val lookup_ = call (load_sym libgtk "gtk_text_tag_table_lookup") (GtkTextTagTableClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkTextTagClass.PolyML.cPtr)
      val remove_ = call (load_sym libgtk "gtk_text_tag_table_remove") (GtkTextTagTableClass.PolyML.cPtr &&> GtkTextTagClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkTextTagTableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a text_tag_class = 'a GtkTextTagClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextTagTableClass.C.fromPtr true) new_ ()
    fun add self tag = (GtkTextTagTableClass.C.withPtr &&&> GtkTextTagClass.C.withPtr ---> I) add_ (self & tag)
    fun getSize self = (GtkTextTagTableClass.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun lookup self name = (GtkTextTagTableClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkTextTagClass.C.fromPtr false) lookup_ (self & name)
    fun remove self tag = (GtkTextTagTableClass.C.withPtr &&&> GtkTextTagClass.C.withPtr ---> I) remove_ (self & tag)
    local
      open ClosureMarshal Signal
    in
      fun tagAddedSig f = signal "tag-added" (get 0w1 GtkTextTagClass.t ---> ret_void) f
      fun tagChangedSig f = signal "tag-changed" (get 0w1 GtkTextTagClass.t &&&> get 0w2 boolean ---> ret_void) (fn tag & sizeChanged => f tag sizeChanged)
      fun tagRemovedSig f = signal "tag-removed" (get 0w1 GtkTextTagClass.t ---> ret_void) f
    end
  end
