structure GioFileIcon :>
  GIO_FILE_ICON
    where type 'a class = 'a GioFileIconClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_file_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_file_icon_new" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> GioFileIconClass.FFI.notnull GioFileIconClass.FFI.p;
    val getFile_ = _import "g_file_icon_get_file" : GioFileIconClass.FFI.notnull GioFileIconClass.FFI.p -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    type 'a class = 'a GioFileIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr ---> GioLoadableIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new file = (GioFileClass.FFI.withPtr ---> GioFileIconClass.FFI.fromPtr true) new_ file
    fun getFile self = (GioFileIconClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr false) getFile_ self
    local
      open Property
    in
      val fileProp =
        {
          get = fn x => get "file" GioFileClass.tOpt x,
          new = fn x => new "file" GioFileClass.tOpt x
        }
    end
  end
