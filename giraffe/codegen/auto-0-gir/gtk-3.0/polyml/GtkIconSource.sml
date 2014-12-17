structure GtkIconSource :>
  GTK_ICON_SOURCE
    where type record_t = GtkIconSourceRecord.t
    where type textdirection_t = GtkTextDirection.t
    where type statetype_t = GtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_source_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_icon_source_new") (FFI.PolyML.VOID --> GtkIconSourceRecord.PolyML.PTR)
      val copy_ = call (load_sym libgtk "gtk_icon_source_copy") (GtkIconSourceRecord.PolyML.PTR --> GtkIconSourceRecord.PolyML.PTR)
      val getDirection_ = call (load_sym libgtk "gtk_icon_source_get_direction") (GtkIconSourceRecord.PolyML.PTR --> GtkTextDirection.PolyML.VAL)
      val getDirectionWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_direction_wildcarded") (GtkIconSourceRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getFilename_ = call (load_sym libgtk "gtk_icon_source_get_filename") (GtkIconSourceRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getIconName_ = call (load_sym libgtk "gtk_icon_source_get_icon_name") (GtkIconSourceRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPixbuf_ = call (load_sym libgtk "gtk_icon_source_get_pixbuf") (GtkIconSourceRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSize_ = call (load_sym libgtk "gtk_icon_source_get_size") (GtkIconSourceRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getSizeWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_size_wildcarded") (GtkIconSourceRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getState_ = call (load_sym libgtk "gtk_icon_source_get_state") (GtkIconSourceRecord.PolyML.PTR --> GtkStateType.PolyML.VAL)
      val getStateWildcarded_ = call (load_sym libgtk "gtk_icon_source_get_state_wildcarded") (GtkIconSourceRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setDirection_ = call (load_sym libgtk "gtk_icon_source_set_direction") (GtkIconSourceRecord.PolyML.PTR &&> GtkTextDirection.PolyML.VAL --> FFI.PolyML.VOID)
      val setDirectionWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_direction_wildcarded") (GtkIconSourceRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setFilename_ = call (load_sym libgtk "gtk_icon_source_set_filename") (GtkIconSourceRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setIconName_ = call (load_sym libgtk "gtk_icon_source_set_icon_name") (GtkIconSourceRecord.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setPixbuf_ = call (load_sym libgtk "gtk_icon_source_set_pixbuf") (GtkIconSourceRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setSize_ = call (load_sym libgtk "gtk_icon_source_set_size") (GtkIconSourceRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setSizeWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_size_wildcarded") (GtkIconSourceRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setState_ = call (load_sym libgtk "gtk_icon_source_set_state") (GtkIconSourceRecord.PolyML.PTR &&> GtkStateType.PolyML.VAL --> FFI.PolyML.VOID)
      val setStateWildcarded_ = call (load_sym libgtk "gtk_icon_source_set_state_wildcarded") (GtkIconSourceRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
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
