structure GioFileIcon :>
  GIO_FILE_ICON
    where type 'a class = 'a GioFileIconClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getFile_ = call (getSymbol "g_file_icon_get_file") (GioFileIconClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
    end
    type 'a class = 'a GioFileIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr ---> GioLoadableIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFile self = (GioFileIconClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr false) getFile_ self
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
