structure GioUnixMountPoint :>
  GIO_UNIX_MOUNT_POINT
    where type t = GioUnixMountPointRecord.t
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val compare_ = fn x1 & x2 => (_import "g_unix_mount_point_compare" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p * GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getDevicePath_ = _import "g_unix_mount_point_get_device_path" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFsType_ = _import "g_unix_mount_point_get_fs_type" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getMountPath_ = _import "g_unix_mount_point_get_mount_path" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getOptions_ = _import "g_unix_mount_point_get_options" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val guessCanEject_ = _import "g_unix_mount_point_guess_can_eject" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GBool.FFI.val_;
    val guessIcon_ = _import "g_unix_mount_point_guess_icon" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val guessName_ = _import "g_unix_mount_point_guess_name" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val guessSymbolicIcon_ = _import "g_unix_mount_point_guess_symbolic_icon" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val isLoopback_ = _import "g_unix_mount_point_is_loopback" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GBool.FFI.val_;
    val isReadonly_ = _import "g_unix_mount_point_is_readonly" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GBool.FFI.val_;
    val isUserMountable_ = _import "g_unix_mount_point_is_user_mountable" : GioUnixMountPointRecord.FFI.non_opt GioUnixMountPointRecord.FFI.p -> GBool.FFI.val_;
    type t = GioUnixMountPointRecord.t
    type 'a icon_class = 'a GioIconClass.class
    fun compare self mount2 = (GioUnixMountPointRecord.FFI.withPtr false &&&> GioUnixMountPointRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) compare_ (self & mount2)
    fun getDevicePath self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDevicePath_ self before GioUnixMountPointRecord.FFI.touchPtr self
    fun getFsType self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFsType_ self before GioUnixMountPointRecord.FFI.touchPtr self
    fun getMountPath self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMountPath_ self before GioUnixMountPointRecord.FFI.touchPtr self
    fun getOptions self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getOptions_ self before GioUnixMountPointRecord.FFI.touchPtr self
    fun guessCanEject self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) guessCanEject_ self
    fun guessIcon self = (GioUnixMountPointRecord.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) guessIcon_ self
    fun guessName self = (GioUnixMountPointRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) guessName_ self
    fun guessSymbolicIcon self = (GioUnixMountPointRecord.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) guessSymbolicIcon_ self
    fun isLoopback self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isLoopback_ self
    fun isReadonly self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isReadonly_ self
    fun isUserMountable self = (GioUnixMountPointRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isUserMountable_ self
  end
