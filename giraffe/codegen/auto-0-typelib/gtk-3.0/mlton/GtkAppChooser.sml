structure GtkAppChooser :>
  GTK_APP_CHOOSER
    where type 'a class = 'a GtkAppChooserClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_get_type" : unit -> GObjectType.C.val_;
    val getAppInfo_ = _import "gtk_app_chooser_get_app_info" : GtkAppChooserClass.C.notnull GtkAppChooserClass.C.p -> GioAppInfoClass.C.notnull GioAppInfoClass.C.p;
    val getContentType_ = _import "gtk_app_chooser_get_content_type" : GtkAppChooserClass.C.notnull GtkAppChooserClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val refresh_ = _import "gtk_app_chooser_refresh" : GtkAppChooserClass.C.notnull GtkAppChooserClass.C.p -> unit;
    type 'a class = 'a GtkAppChooserClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAppInfo self = (GtkAppChooserClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) getAppInfo_ self
    fun getContentType self = (GtkAppChooserClass.C.withPtr ---> Utf8.C.fromPtr true) getContentType_ self
    fun refresh self = (GtkAppChooserClass.C.withPtr ---> I) refresh_ self
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
