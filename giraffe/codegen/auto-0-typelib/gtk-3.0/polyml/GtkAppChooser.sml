structure GtkAppChooser :>
  GTK_APP_CHOOSER
    where type 'a class = 'a GtkAppChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getAppInfo_ = call (load_sym libgtk "gtk_app_chooser_get_app_info") (GtkAppChooserClass.PolyML.cPtr --> GioAppInfoClass.PolyML.cPtr)
      val getContentType_ = call (load_sym libgtk "gtk_app_chooser_get_content_type") (GtkAppChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val refresh_ = call (load_sym libgtk "gtk_app_chooser_refresh") (GtkAppChooserClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkAppChooserClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAppInfo self = (GtkAppChooserClass.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr true) getAppInfo_ self
    fun getContentType self = (GtkAppChooserClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getContentType_ self
    fun refresh self = (GtkAppChooserClass.FFI.withPtr ---> I) refresh_ self
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
