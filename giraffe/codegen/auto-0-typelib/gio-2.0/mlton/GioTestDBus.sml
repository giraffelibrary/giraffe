structure GioTestDBus :>
  GIO_TEST_D_BUS
    where type 'a class = 'a GioTestDBusClass.class
    where type test_d_bus_flags_t = GioTestDBusFlags.t =
  struct
    val getType_ = _import "g_test_dbus_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_test_dbus_new" : GioTestDBusFlags.FFI.val_ -> GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p;
    val unset_ = _import "g_test_dbus_unset" : unit -> unit;
    val addServiceDir_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_test_dbus_add_service_dir" :
              GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val down_ = _import "g_test_dbus_down" : GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p -> unit;
    val getBusAddress_ = _import "g_test_dbus_get_bus_address" : GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p -> unit Utf8.FFI.out_p;
    val getFlags_ = _import "g_test_dbus_get_flags" : GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p -> GioTestDBusFlags.FFI.val_;
    val stop_ = _import "g_test_dbus_stop" : GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p -> unit;
    val up_ = _import "g_test_dbus_up" : GioTestDBusClass.FFI.notnull GioTestDBusClass.FFI.p -> unit;
    type 'a class = 'a GioTestDBusClass.class
    type test_d_bus_flags_t = GioTestDBusFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new flags = (GioTestDBusFlags.FFI.withVal ---> GioTestDBusClass.FFI.fromPtr true) new_ flags
    fun unset () = (I ---> I) unset_ ()
    fun addServiceDir self path = (GioTestDBusClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addServiceDir_ (self & path)
    fun down self = (GioTestDBusClass.FFI.withPtr ---> I) down_ self
    fun getBusAddress self = (GioTestDBusClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getBusAddress_ self
    fun getFlags self = (GioTestDBusClass.FFI.withPtr ---> GioTestDBusFlags.FFI.fromVal) getFlags_ self
    fun stop self = (GioTestDBusClass.FFI.withPtr ---> I) stop_ self
    fun up self = (GioTestDBusClass.FFI.withPtr ---> I) up_ self
    local
      open Property
    in
      val flagsProp =
        {
          get = fn x => get "flags" GioTestDBusFlags.t x,
          set = fn x => set "flags" GioTestDBusFlags.t x
        }
    end
  end
