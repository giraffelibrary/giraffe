structure GtkIconSource :>
  GTK_ICON_SOURCE
    where type record_t = GtkIconSourceRecord.t
    where type textdirection_t = GtkTextDirection.t
    where type statetype_t = GtkStateType.t =
  struct
    val getType_ = _import "gtk_icon_source_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_source_new" : unit -> GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p;
    val copy_ = _import "gtk_icon_source_copy" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p;
    val getDirection_ = _import "gtk_icon_source_get_direction" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> GtkTextDirection.C.val_;
    val getDirectionWildcarded_ = _import "gtk_icon_source_get_direction_wildcarded" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> FFI.Bool.C.val_;
    val getFilename_ = _import "gtk_icon_source_get_filename" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getIconName_ = _import "gtk_icon_source_get_icon_name" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPixbuf_ = _import "gtk_icon_source_get_pixbuf" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSize_ = _import "gtk_icon_source_get_size" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> FFI.Int.C.val_;
    val getSizeWildcarded_ = _import "gtk_icon_source_get_size_wildcarded" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> FFI.Bool.C.val_;
    val getState_ = _import "gtk_icon_source_get_state" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> GtkStateType.C.val_;
    val getStateWildcarded_ = _import "gtk_icon_source_get_state_wildcarded" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> FFI.Bool.C.val_;
    val setDirection_ = fn x1 & x2 => (_import "gtk_icon_source_set_direction" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * GtkTextDirection.C.val_ -> unit;) (x1, x2)
    val setDirectionWildcarded_ = fn x1 & x2 => (_import "gtk_icon_source_set_direction_wildcarded" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_source_set_filename" :
              GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_source_set_icon_name" :
              GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_icon_source_set_pixbuf" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setSize_ = fn x1 & x2 => (_import "gtk_icon_source_set_size" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setSizeWildcarded_ = fn x1 & x2 => (_import "gtk_icon_source_set_size_wildcarded" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "gtk_icon_source_set_state" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * GtkStateType.C.val_ -> unit;) (x1, x2)
    val setStateWildcarded_ = fn x1 & x2 => (_import "gtk_icon_source_set_state_wildcarded" : GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type record_t = GtkIconSourceRecord.t
    type textdirection_t = GtkTextDirection.t
    type statetype_t = GtkStateType.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconSourceRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkIconSourceRecord.C.withPtr ---> GtkIconSourceRecord.C.fromPtr true) copy_ self
    fun getDirection self = (GtkIconSourceRecord.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getDirectionWildcarded self = (GtkIconSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getDirectionWildcarded_ self
    fun getFilename self = (GtkIconSourceRecord.C.withPtr ---> FFI.String.C.fromPtr false) getFilename_ self
    fun getIconName self = (GtkIconSourceRecord.C.withPtr ---> FFI.String.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GtkIconSourceRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getSize self = (GtkIconSourceRecord.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun getSizeWildcarded self = (GtkIconSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getSizeWildcarded_ self
    fun getState self = (GtkIconSourceRecord.C.withPtr ---> GtkStateType.C.fromVal) getState_ self
    fun getStateWildcarded self = (GtkIconSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getStateWildcarded_ self
    fun setDirection self direction = (GtkIconSourceRecord.C.withPtr &&&> GtkTextDirection.C.withVal ---> I) setDirection_ (self & direction)
    fun setDirectionWildcarded self setting = (GtkIconSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDirectionWildcarded_ (self & setting)
    fun setFilename self filename = (GtkIconSourceRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setFilename_ (self & filename)
    fun setIconName self iconName = (GtkIconSourceRecord.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkIconSourceRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setSize self size = (GtkIconSourceRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & size)
    fun setSizeWildcarded self setting = (GtkIconSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSizeWildcarded_ (self & setting)
    fun setState self state = (GtkIconSourceRecord.C.withPtr &&&> GtkStateType.C.withVal ---> I) setState_ (self & state)
    fun setStateWildcarded self setting = (GtkIconSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setStateWildcarded_ (self & setting)
  end
