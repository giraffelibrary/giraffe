structure GioFileIcon :>
  GIO_FILE_ICON
    where type 'a class = 'a GioFileIconClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_file_icon_get_type" : unit -> GObjectType.C.val_;
    val getFile_ = _import "g_file_icon_get_file" : GioFileIconClass.C.notnull GioFileIconClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    type 'a class = 'a GioFileIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.C.withPtr ---> GioLoadableIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFile self = (GioFileIconClass.C.withPtr ---> GioFileClass.C.fromPtr false) getFile_ self
    local
      open Property
    in
      val fileProp =
        {
          get = fn x => get "file" GioFileClass.tOpt x,
          set = fn x => set "file" GioFileClass.tOpt x
        }
    end
  end
