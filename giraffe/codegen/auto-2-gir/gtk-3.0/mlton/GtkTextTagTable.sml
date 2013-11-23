structure GtkTextTagTable :>
  GTK_TEXT_TAG_TABLE
    where type 'a class_t = 'a GtkTextTagTableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a texttagclass_t = 'a GtkTextTagClass.t =
  struct
    val getType_ = _import "gtk_text_tag_table_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_text_tag_table_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val add_ = fn x1 & x2 => (_import "gtk_text_tag_table_add" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getSize_ = _import "gtk_text_tag_table_get_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_tag_table_lookup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_text_tag_table_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkTextTagTableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a texttagclass_t = 'a GtkTextTagClass.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextTagTableClass.C.fromPtr true) new_ ()
    fun add self tag = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add_ (self & tag)
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun lookup self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkTextTagClass.C.fromPtr false) lookup_ (self & name)
    fun remove self tag = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & tag)
    local
      open ClosureMarshal Signal
    in
      fun tagAddedSig f = signal "tag-added" (get 0w1 GtkTextTagClass.t ---> ret_void) f
      fun tagChangedSig f = signal "tag-changed" (get 0w1 GtkTextTagClass.t &&&> get 0w2 boolean ---> ret_void) (fn tag & sizeChanged => f tag sizeChanged)
      fun tagRemovedSig f = signal "tag-removed" (get 0w1 GtkTextTagClass.t ---> ret_void) f
    end
  end
