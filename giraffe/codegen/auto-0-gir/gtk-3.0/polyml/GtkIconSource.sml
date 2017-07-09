structure GtkIconSource :>
  GTK_ICON_SOURCE
    where type t = GtkIconSourceRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type state_type_t = GtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_source_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_icon_source_new") (cVoid --> GtkIconSourceRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "gtk_icon_source_copy") (GtkIconSourceRecord.PolyML.cPtr --> GtkIconSourceRecord.PolyML.cPtr)
      val getDirection_ = call (getSymbol "gtk_icon_source_get_direction") (GtkIconSourceRecord.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getDirectionWildcarded_ = call (getSymbol "gtk_icon_source_get_direction_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFilename_ = call (getSymbol "gtk_icon_source_get_filename") (GtkIconSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIconName_ = call (getSymbol "gtk_icon_source_get_icon_name") (GtkIconSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (getSymbol "gtk_icon_source_get_pixbuf") (GtkIconSourceRecord.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getSize_ = call (getSymbol "gtk_icon_source_get_size") (GtkIconSourceRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSizeWildcarded_ = call (getSymbol "gtk_icon_source_get_size_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getState_ = call (getSymbol "gtk_icon_source_get_state") (GtkIconSourceRecord.PolyML.cPtr --> GtkStateType.PolyML.cVal)
      val getStateWildcarded_ = call (getSymbol "gtk_icon_source_get_state_wildcarded") (GtkIconSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setDirection_ = call (getSymbol "gtk_icon_source_set_direction") (GtkIconSourceRecord.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> cVoid)
      val setDirectionWildcarded_ = call (getSymbol "gtk_icon_source_set_direction_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFilename_ = call (getSymbol "gtk_icon_source_set_filename") (GtkIconSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setIconName_ = call (getSymbol "gtk_icon_source_set_icon_name") (GtkIconSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setPixbuf_ = call (getSymbol "gtk_icon_source_set_pixbuf") (GtkIconSourceRecord.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val setSize_ = call (getSymbol "gtk_icon_source_set_size") (GtkIconSourceRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setSizeWildcarded_ = call (getSymbol "gtk_icon_source_set_size_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setState_ = call (getSymbol "gtk_icon_source_set_state") (GtkIconSourceRecord.PolyML.cPtr &&> GtkStateType.PolyML.cVal --> cVoid)
      val setStateWildcarded_ = call (getSymbol "gtk_icon_source_set_state_wildcarded") (GtkIconSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
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
