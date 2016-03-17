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
      val getType_ = call (load_sym libgio "g_file_icon_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getFile_ = call (load_sym libgio "g_file_icon_get_file") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GioFileIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.C.withPtr ---> GioLoadableIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr false) getFile_ self
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
