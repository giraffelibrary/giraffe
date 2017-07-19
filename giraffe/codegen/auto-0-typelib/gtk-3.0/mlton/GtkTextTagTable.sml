structure GtkTextTagTable :>
  GTK_TEXT_TAG_TABLE
    where type 'a class = 'a GtkTextTagTableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a text_tag_class = 'a GtkTextTagClass.class =
  struct
    val getType_ = _import "gtk_text_tag_table_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_text_tag_table_new" : unit -> GtkTextTagTableClass.FFI.notnull GtkTextTagTableClass.FFI.p;
    val add_ = fn x1 & x2 => (_import "gtk_text_tag_table_add" : GtkTextTagTableClass.FFI.notnull GtkTextTagTableClass.FFI.p * GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p -> unit;) (x1, x2)
    val getSize_ = _import "gtk_text_tag_table_get_size" : GtkTextTagTableClass.FFI.notnull GtkTextTagTableClass.FFI.p -> GInt32.FFI.val_;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_tag_table_lookup" :
              GtkTextTagTableClass.FFI.notnull GtkTextTagTableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_text_tag_table_remove" : GtkTextTagTableClass.FFI.notnull GtkTextTagTableClass.FFI.p * GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTextTagTableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a text_tag_class = 'a GtkTextTagClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextTagTableClass.FFI.fromPtr true) new_ ()
    fun add self tag = (GtkTextTagTableClass.FFI.withPtr &&&> GtkTextTagClass.FFI.withPtr ---> I) add_ (self & tag)
    fun getSize self = (GtkTextTagTableClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSize_ self
    fun lookup self name = (GtkTextTagTableClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkTextTagClass.FFI.fromPtr false) lookup_ (self & name)
    fun remove self tag = (GtkTextTagTableClass.FFI.withPtr &&&> GtkTextTagClass.FFI.withPtr ---> I) remove_ (self & tag)
    local
      open ClosureMarshal Signal
    in
      fun tagAddedSig f = signal "tag-added" (get 0w1 GtkTextTagClass.t ---> ret_void) f
      fun tagChangedSig f = signal "tag-changed" (get 0w1 GtkTextTagClass.t &&&> get 0w2 boolean ---> ret_void) (fn tag & sizeChanged => f (tag, sizeChanged))
      fun tagRemovedSig f = signal "tag-removed" (get 0w1 GtkTextTagClass.t ---> ret_void) f
    end
  end
