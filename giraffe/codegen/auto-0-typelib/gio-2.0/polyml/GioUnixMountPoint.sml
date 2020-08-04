structure GioUnixMountPoint :>
  GIO_UNIX_MOUNT_POINT
    where type t = GioUnixMountPointRecord.t
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val compare_ = call (getSymbol "g_unix_mount_point_compare") (GioUnixMountPointRecord.PolyML.cPtr &&> GioUnixMountPointRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDevicePath_ = call (getSymbol "g_unix_mount_point_get_device_path") (GioUnixMountPointRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFsType_ = call (getSymbol "g_unix_mount_point_get_fs_type") (GioUnixMountPointRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMountPath_ = call (getSymbol "g_unix_mount_point_get_mount_path") (GioUnixMountPointRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getOptions_ = call (getSymbol "g_unix_mount_point_get_options") (GioUnixMountPointRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val guessCanEject_ = call (getSymbol "g_unix_mount_point_guess_can_eject") (GioUnixMountPointRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val guessIcon_ = call (getSymbol "g_unix_mount_point_guess_icon") (GioUnixMountPointRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val guessName_ = call (getSymbol "g_unix_mount_point_guess_name") (GioUnixMountPointRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val guessSymbolicIcon_ = call (getSymbol "g_unix_mount_point_guess_symbolic_icon") (GioUnixMountPointRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val isLoopback_ = call (getSymbol "g_unix_mount_point_is_loopback") (GioUnixMountPointRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isReadonly_ = call (getSymbol "g_unix_mount_point_is_readonly") (GioUnixMountPointRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isUserMountable_ = call (getSymbol "g_unix_mount_point_is_user_mountable") (GioUnixMountPointRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GioUnixMountPointRecord.t
    type 'a icon_class = 'a GioIconClass.class
    fun compare self mount2 = (GioUnixMountPointRecord.FFI.withPtr false &&&> GioUnixMountPointRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) compare_ (self & mount2)
    fun getDevicePath self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDevicePath_ self
    fun getFsType self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFsType_ self
    fun getMountPath self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMountPath_ self
    fun getOptions self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getOptions_ self
    fun guessCanEject self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) guessCanEject_ self
    fun guessIcon self = (GioUnixMountPointRecord.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) guessIcon_ self
    fun guessName self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) guessName_ self
    fun guessSymbolicIcon self = (GioUnixMountPointRecord.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) guessSymbolicIcon_ self
    fun isLoopback self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isLoopback_ self
    fun isReadonly self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isReadonly_ self
    fun isUserMountable self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isUserMountable_ self
  end
