structure GtkAppChooser :>
  GTK_APP_CHOOSER
    where type 'a class_t = 'a GtkAppChooserClass.t =
  struct
    val getType_ = _import "gtk_app_chooser_get_type" : unit -> GObjectType.C.val_;
    val getAppInfo_ = _import "gtk_app_chooser_get_app_info" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getContentType_ = _import "gtk_app_chooser_get_content_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val refresh_ = _import "gtk_app_chooser_refresh" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkAppChooserClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAppInfo self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) getAppInfo_ self
    fun getContentType self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getContentType_ self
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
