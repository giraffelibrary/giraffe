structure GtkIconSource :>
  GTK_ICON_SOURCE
    where type record_t = GtkIconSourceRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type state_type_t = GtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_source_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_source_new") (FFI.PolyML.cVoid --> GtkIconSourceRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_icon_source_copy") (GtkIconSourceRecord.PolyML.cPtr --> GtkIconSourceRecord.PolyML.cPtr)
      val getDirection_ = call (load_sym libgtk "gtk_icon_source_get_direction") (GtkIconSourceRecord.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getDirectionWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_direction_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFilename_ = call (load_sym libgtk "gtk_icon_source_get_filename") (GtkIconSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIconName_ = call (load_sym libgtk "gtk_icon_source_get_icon_name") (GtkIconSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (load_sym libgtk "gtk_icon_source_get_pixbuf") (GtkIconSourceRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSize_ = call (load_sym libgtk "gtk_icon_source_get_size") (GtkIconSourceRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getSizeWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_size_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getState_ = call (load_sym libgtk "gtk_icon_source_get_state") (GtkIconSourceRecord.PolyML.cPtr --> GtkStateType.PolyML.cVal)
      val getStateWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_state_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setDirection_ = call (load_sym libgtk "gtk_icon_source_set_direction") (GtkIconSourceRecord.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDirectionWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_direction_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFilename_ = call (load_sym libgtk "gtk_icon_source_set_filename") (GtkIconSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setIconName_ = call (load_sym libgtk "gtk_icon_source_set_icon_name") (GtkIconSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setPixbuf_ = call (load_sym libgtk "gtk_icon_source_set_pixbuf") (GtkIconSourceRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setSize_ = call (load_sym libgtk "gtk_icon_source_set_size") (GtkIconSourceRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSizeWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_size_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setState_ = call (load_sym libgtk "gtk_icon_source_set_state") (GtkIconSourceRecord.PolyML.cPtr &&> GtkStateType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setStateWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_state_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type record_t = GtkIconSourceRecord.t
    type text_direction_t = GtkTextDirection.t
    type state_type_t = GtkStateType.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconSourceRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkIconSourceRecord.C.withPtr ---> GtkIconSourceRecord.C.fromPtr true) copy_ self
    fun getDirection self = (GtkIconSourceRecord.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getDirectionWildcarded self = (GtkIconSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getDirectionWildcarded_ self
    fun getFilename self = (GtkIconSourceRecord.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun getIconName self = (GtkIconSourceRecord.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GtkIconSourceRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getSize self = (GtkIconSourceRecord.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun getSizeWildcarded self = (GtkIconSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getSizeWildcarded_ self
    fun getState self = (GtkIconSourceRecord.C.withPtr ---> GtkStateType.C.fromVal) getState_ self
    fun getStateWildcarded self = (GtkIconSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getStateWildcarded_ self
    fun setDirection self direction = (GtkIconSourceRecord.C.withPtr &&&> GtkTextDirection.C.withVal ---> I) setDirection_ (self & direction)
    fun setDirectionWildcarded self setting = (GtkIconSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDirectionWildcarded_ (self & setting)
    fun setFilename self filename = (GtkIconSourceRecord.C.withPtr &&&> Utf8.C.withPtr ---> I) setFilename_ (self & filename)
    fun setIconName self iconName = (GtkIconSourceRecord.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkIconSourceRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setPixbuf_ (self & pixbuf)
    fun setSize self size = (GtkIconSourceRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & size)
    fun setSizeWildcarded self setting = (GtkIconSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSizeWildcarded_ (self & setting)
    fun setState self state = (GtkIconSourceRecord.C.withPtr &&&> GtkStateType.C.withVal ---> I) setState_ (self & state)
    fun setStateWildcarded self setting = (GtkIconSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setStateWildcarded_ (self & setting)
  end
