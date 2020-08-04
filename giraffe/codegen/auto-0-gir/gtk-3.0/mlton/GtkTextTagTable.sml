structure GtkTextTagTable :>
  GTK_TEXT_TAG_TABLE
    where type 'a class = 'a GtkTextTagTableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a text_tag_class = 'a GtkTextTagClass.class =
  struct
    val getType_ = _import "gtk_text_tag_table_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_text_tag_table_new" : unit -> GtkTextTagTableClass.FFI.non_opt GtkTextTagTableClass.FFI.p;
    val add_ = fn x1 & x2 => (_import "gtk_text_tag_table_add" : GtkTextTagTableClass.FFI.non_opt GtkTextTagTableClass.FFI.p * GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getSize_ = _import "gtk_text_tag_table_get_size" : GtkTextTagTableClass.FFI.non_opt GtkTextTagTableClass.FFI.p -> GInt.FFI.val_;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_tag_table_lookup" :
              GtkTextTagTableClass.FFI.non_opt GtkTextTagTableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkTextTagClass.FFI.opt GtkTextTagClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_text_tag_table_remove" : GtkTextTagTableClass.FFI.non_opt GtkTextTagTableClass.FFI.p * GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTextTagTableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a text_tag_class = 'a GtkTextTagClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextTagTableClass.FFI.fromPtr true) new_ ()
    fun add self tag = (GtkTextTagTableClass.FFI.withPtr false &&&> GtkTextTagClass.FFI.withPtr false ---> GBool.FFI.fromVal) add_ (self & tag)
    fun getSize self = (GtkTextTagTableClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSize_ self
    fun lookup self name = (GtkTextTagTableClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkTextTagClass.FFI.fromOptPtr false) lookup_ (self & name)
    fun remove self tag = (GtkTextTagTableClass.FFI.withPtr false &&&> GtkTextTagClass.FFI.withPtr false ---> I) remove_ (self & tag)
    local
      open ClosureMarshal Signal
    in
      fun tagAddedSig f = signal "tag-added" (get 0w1 GtkTextTagClass.t ---> ret_void) f
      fun tagChangedSig f = signal "tag-changed" (get 0w1 GtkTextTagClass.t &&&> get 0w2 boolean ---> ret_void) (fn tag & sizeChanged => f (tag, sizeChanged))
      fun tagRemovedSig f = signal "tag-removed" (get 0w1 GtkTextTagClass.t ---> ret_void) f
    end
  end
