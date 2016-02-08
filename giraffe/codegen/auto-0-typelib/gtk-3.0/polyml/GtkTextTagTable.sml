structure GtkTextTagTable :>
  GTK_TEXT_TAG_TABLE
    where type 'a class_t = 'a GtkTextTagTableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a text_tag_class_t = 'a GtkTextTagClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_tag_table_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_text_tag_table_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val add_ = call (load_sym libgtk "gtk_text_tag_table_add") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getSize_ = call (load_sym libgtk "gtk_text_tag_table_get_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val lookup_ = call (load_sym libgtk "gtk_text_tag_table_lookup") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val remove_ = call (load_sym libgtk "gtk_text_tag_table_remove") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTextTagTableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a text_tag_class_t = 'a GtkTextTagClass.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextTagTableClass.C.fromPtr true) new_ ()
    fun add self tag = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add_ (self & tag)
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSize_ self
    fun lookup self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> GtkTextTagClass.C.fromPtr false) lookup_ (self & name)
    fun remove self tag = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & tag)
    local
      open ClosureMarshal Signal
    in
      fun tagAddedSig f = signal "tag-added" (get 0w1 GtkTextTagClass.t ---> ret_void) f
      fun tagChangedSig f = signal "tag-changed" (get 0w1 GtkTextTagClass.t &&&> get 0w2 boolean ---> ret_void) (fn tag & sizeChanged => f tag sizeChanged)
      fun tagRemovedSig f = signal "tag-removed" (get 0w1 GtkTextTagClass.t ---> ret_void) f
    end
  end
