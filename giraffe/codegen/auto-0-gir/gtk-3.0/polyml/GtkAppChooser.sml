structure GtkAppChooser :>
  GTK_APP_CHOOSER
    where type 'a class_t = 'a GtkAppChooserClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getAppInfo_ = call (load_sym libgtk "gtk_app_chooser_get_app_info") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getContentType_ = call (load_sym libgtk "gtk_app_chooser_get_content_type") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val refresh_ = call (load_sym libgtk "gtk_app_chooser_refresh") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAppChooserClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAppInfo self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) getAppInfo_ self
    fun getContentType self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getContentType_ self
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
