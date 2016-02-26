structure GtkAppChooser :>
  GTK_APP_CHOOSER
    where type 'a class_t = 'a GtkAppChooserClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getAppInfo_ = call (load_sym libgtk "gtk_app_chooser_get_app_info") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getContentType_ = call (load_sym libgtk "gtk_app_chooser_get_content_type") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val refresh_ = call (load_sym libgtk "gtk_app_chooser_refresh") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkAppChooserClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAppInfo self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) getAppInfo_ self
    fun getContentType self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getContentType_ self
    fun refresh self = (GObjectObjectClass.C.withPtr ---> I) refresh_ self
    local
      open Property
    in
      val contentTypeProp =
        {
          get = fn x => get "content-type" stringOpt x,
          set = fn x => set "content-type" stringOpt x
        }
    end
  end
