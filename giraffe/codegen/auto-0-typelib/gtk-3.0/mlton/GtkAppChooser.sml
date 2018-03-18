structure GtkAppChooser :>
  GTK_APP_CHOOSER
    where type 'a class = 'a GtkAppChooserClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val getAppInfo_ = _import "gtk_app_chooser_get_app_info" : GtkAppChooserClass.FFI.notnull GtkAppChooserClass.FFI.p -> unit GioAppInfoClass.FFI.p;
    val getContentType_ = _import "gtk_app_chooser_get_content_type" : GtkAppChooserClass.FFI.notnull GtkAppChooserClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val refresh_ = _import "gtk_app_chooser_refresh" : GtkAppChooserClass.FFI.notnull GtkAppChooserClass.FFI.p -> unit;
    type 'a class = 'a GtkAppChooserClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAppInfo self = (GtkAppChooserClass.FFI.withPtr ---> GioAppInfoClass.FFI.fromOptPtr true) getAppInfo_ self
    fun getContentType self = (GtkAppChooserClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getContentType_ self
    fun refresh self = (GtkAppChooserClass.FFI.withPtr ---> I) refresh_ self
    local
      open Property
    in
      val contentTypeProp =
        {
          get = fn x => get "content-type" stringOpt x,
          new = fn x => new "content-type" stringOpt x
        }
    end
  end
