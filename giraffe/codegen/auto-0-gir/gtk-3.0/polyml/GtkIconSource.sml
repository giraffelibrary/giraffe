structure GtkIconSource :>
  GTK_ICON_SOURCE
    where type t = GtkIconSourceRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type state_type_t = GtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_source_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_source_new") (PolyMLFFI.cVoid --> GtkIconSourceRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_icon_source_copy") (GtkIconSourceRecord.PolyML.cPtr --> GtkIconSourceRecord.PolyML.cPtr)
      val getDirection_ = call (load_sym libgtk "gtk_icon_source_get_direction") (GtkIconSourceRecord.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getDirectionWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_direction_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFilename_ = call (load_sym libgtk "gtk_icon_source_get_filename") (GtkIconSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIconName_ = call (load_sym libgtk "gtk_icon_source_get_icon_name") (GtkIconSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (load_sym libgtk "gtk_icon_source_get_pixbuf") (GtkIconSourceRecord.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getSize_ = call (load_sym libgtk "gtk_icon_source_get_size") (GtkIconSourceRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSizeWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_size_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getState_ = call (load_sym libgtk "gtk_icon_source_get_state") (GtkIconSourceRecord.PolyML.cPtr --> GtkStateType.PolyML.cVal)
      val getStateWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_state_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setDirection_ = call (load_sym libgtk "gtk_icon_source_set_direction") (GtkIconSourceRecord.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDirectionWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_direction_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFilename_ = call (load_sym libgtk "gtk_icon_source_set_filename") (GtkIconSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setIconName_ = call (load_sym libgtk "gtk_icon_source_set_icon_name") (GtkIconSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setPixbuf_ = call (load_sym libgtk "gtk_icon_source_set_pixbuf") (GtkIconSourceRecord.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setSize_ = call (load_sym libgtk "gtk_icon_source_set_size") (GtkIconSourceRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSizeWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_size_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setState_ = call (load_sym libgtk "gtk_icon_source_set_state") (GtkIconSourceRecord.PolyML.cPtr &&> GtkStateType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setStateWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_state_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type t = GtkIconSourceRecord.t
    type text_direction_t = GtkTextDirection.t
    type state_type_t = GtkStateType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconSourceRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkIconSourceRecord.FFI.withPtr ---> GtkIconSourceRecord.FFI.fromPtr true) copy_ self
    fun getDirection self = (GtkIconSourceRecord.FFI.withPtr ---> GtkTextDirection.FFI.fromVal) getDirection_ self
    fun getDirectionWildcarded self = (GtkIconSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) getDirectionWildcarded_ self
    fun getFilename self = (GtkIconSourceRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun getIconName self = (GtkIconSourceRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getPixbuf self = (GtkIconSourceRecord.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getSize self = (GtkIconSourceRecord.FFI.withPtr ---> GInt.FFI.fromVal) getSize_ self
    fun getSizeWildcarded self = (GtkIconSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) getSizeWildcarded_ self
    fun getState self = (GtkIconSourceRecord.FFI.withPtr ---> GtkStateType.FFI.fromVal) getState_ self
    fun getStateWildcarded self = (GtkIconSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) getStateWildcarded_ self
    fun setDirection self direction = (GtkIconSourceRecord.FFI.withPtr &&&> GtkTextDirection.FFI.withVal ---> I) setDirection_ (self & direction)
    fun setDirectionWildcarded self setting = (GtkIconSourceRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDirectionWildcarded_ (self & setting)
    fun setFilename self filename = (GtkIconSourceRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFilename_ (self & filename)
    fun setIconName self iconName = (GtkIconSourceRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkIconSourceRecord.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setSize self size = (GtkIconSourceRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSize_ (self & size)
    fun setSizeWildcarded self setting = (GtkIconSourceRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSizeWildcarded_ (self & setting)
    fun setState self state = (GtkIconSourceRecord.FFI.withPtr &&&> GtkStateType.FFI.withVal ---> I) setState_ (self & state)
    fun setStateWildcarded self setting = (GtkIconSourceRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setStateWildcarded_ (self & setting)
  end
