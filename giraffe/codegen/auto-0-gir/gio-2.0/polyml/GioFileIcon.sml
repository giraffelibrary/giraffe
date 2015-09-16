structure GioFileIcon :>
  GIO_FILE_ICON
    where type 'a class_t = 'a GioFileIconClass.t
    where type 'a icon_class_t = 'a GioIconClass.t
    where type 'a loadable_icon_class_t = 'a GioLoadableIconClass.t
    where type 'a file_class_t = 'a GioFileClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_icon_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getFile_ = call (load_sym libgio "g_file_icon_get_file") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioFileIconClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type 'a loadable_icon_class_t = 'a GioLoadableIconClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type t = base class_t
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
