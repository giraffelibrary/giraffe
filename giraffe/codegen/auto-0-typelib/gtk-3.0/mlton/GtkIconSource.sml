structure GtkIconSource :>
  GTK_ICON_SOURCE
    where type t = GtkIconSourceRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type state_type_t = GtkStateType.t =
  struct
    val getType_ = _import "gtk_icon_source_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_icon_source_new" : unit -> GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p;
    val copy_ = _import "gtk_icon_source_copy" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p;
    val getDirection_ = _import "gtk_icon_source_get_direction" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GtkTextDirection.FFI.val_;
    val getDirectionWildcarded_ = _import "gtk_icon_source_get_direction_wildcarded" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GBool.FFI.val_;
    val getFilename_ = _import "gtk_icon_source_get_filename" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getIconName_ = _import "gtk_icon_source_get_icon_name" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPixbuf_ = _import "gtk_icon_source_get_pixbuf" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val getSize_ = _import "gtk_icon_source_get_size" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GInt32.FFI.val_;
    val getSizeWildcarded_ = _import "gtk_icon_source_get_size_wildcarded" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GBool.FFI.val_;
    val getState_ = _import "gtk_icon_source_get_state" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GtkStateType.FFI.val_;
    val getStateWildcarded_ = _import "gtk_icon_source_get_state_wildcarded" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p -> GBool.FFI.val_;
    val setDirection_ = fn x1 & x2 => (_import "gtk_icon_source_set_direction" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GtkTextDirection.FFI.val_ -> unit;) (x1, x2)
    val setDirectionWildcarded_ = fn x1 & x2 => (_import "gtk_icon_source_set_direction_wildcarded" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_source_set_filename" :
              GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_icon_source_set_pixbuf" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setSize_ = fn x1 & x2 => (_import "gtk_icon_source_set_size" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setSizeWildcarded_ = fn x1 & x2 => (_import "gtk_icon_source_set_size_wildcarded" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "gtk_icon_source_set_state" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GtkStateType.FFI.val_ -> unit;) (x1, x2)
    val setStateWildcarded_ = fn x1 & x2 => (_import "gtk_icon_source_set_state_wildcarded" : GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type t = GtkIconSourceRecord.t
    type text_direction_t = GtkTextDirection.t
    type state_type_t = GtkStateType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconSourceRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkIconSourceRecord.FFI.withPtr false ---> GtkIconSourceRecord.FFI.fromPtr true) copy_ self
    fun getDirection self = (GtkIconSourceRecord.FFI.withPtr false ---> GtkTextDirection.FFI.fromVal) getDirection_ self
    fun getDirectionWildcarded self = (GtkIconSourceRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getDirectionWildcarded_ self
    fun getFilename self = (GtkIconSourceRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFilename_ self before GtkIconSourceRecord.FFI.touchPtr self
    fun getIconName self = (GtkIconSourceRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconName_ self before GtkIconSourceRecord.FFI.touchPtr self
    fun getPixbuf self = (GtkIconSourceRecord.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self before GtkIconSourceRecord.FFI.touchPtr self
    fun getSize self = (GtkIconSourceRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getSize_ self
    fun getSizeWildcarded self = (GtkIconSourceRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getSizeWildcarded_ self
    fun getState self = (GtkIconSourceRecord.FFI.withPtr false ---> GtkStateType.FFI.fromVal) getState_ self
    fun getStateWildcarded self = (GtkIconSourceRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getStateWildcarded_ self
    fun setDirection self direction = (GtkIconSourceRecord.FFI.withPtr false &&&> GtkTextDirection.FFI.withVal ---> I) setDirection_ (self & direction)
    fun setDirectionWildcarded self setting = (GtkIconSourceRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDirectionWildcarded_ (self & setting)
    fun setFilename self filename = (GtkIconSourceRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFilename_ (self & filename)
    fun setIconName self iconName = (GtkIconSourceRecord.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkIconSourceRecord.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I) setPixbuf_ (self & pixbuf)
    fun setSize self size = (GtkIconSourceRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSize_ (self & size)
    fun setSizeWildcarded self setting = (GtkIconSourceRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSizeWildcarded_ (self & setting)
    fun setState self state = (GtkIconSourceRecord.FFI.withPtr false &&&> GtkStateType.FFI.withVal ---> I) setState_ (self & state)
    fun setStateWildcarded self setting = (GtkIconSourceRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setStateWildcarded_ (self & setting)
  end
