structure GioTestDBus :>
  GIO_TEST_D_BUS
    where type 'a class = 'a GioTestDBusClass.class
    where type test_d_bus_flags_t = GioTestDBusFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_test_dbus_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_test_dbus_new") (GioTestDBusFlags.PolyML.cVal --> GioTestDBusClass.PolyML.cPtr)
      val unset_ = call (getSymbol "g_test_dbus_unset") (cVoid --> cVoid)
      val addServiceDir_ = call (getSymbol "g_test_dbus_add_service_dir") (GioTestDBusClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val down_ = call (getSymbol "g_test_dbus_down") (GioTestDBusClass.PolyML.cPtr --> cVoid)
      val getBusAddress_ = call (getSymbol "g_test_dbus_get_bus_address") (GioTestDBusClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getFlags_ = call (getSymbol "g_test_dbus_get_flags") (GioTestDBusClass.PolyML.cPtr --> GioTestDBusFlags.PolyML.cVal)
      val stop_ = call (getSymbol "g_test_dbus_stop") (GioTestDBusClass.PolyML.cPtr --> cVoid)
      val up_ = call (getSymbol "g_test_dbus_up") (GioTestDBusClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioTestDBusClass.class
    type test_d_bus_flags_t = GioTestDBusFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new flags = (GioTestDBusFlags.FFI.withVal ---> GioTestDBusClass.FFI.fromPtr true) new_ flags
    fun unset () = (I ---> I) unset_ ()
    fun addServiceDir self path = (GioTestDBusClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addServiceDir_ (self & path)
    fun down self = (GioTestDBusClass.FFI.withPtr false ---> I) down_ self
    fun getBusAddress self = (GioTestDBusClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getBusAddress_ self before GioTestDBusClass.FFI.touchPtr self
    fun getFlags self = (GioTestDBusClass.FFI.withPtr false ---> GioTestDBusFlags.FFI.fromVal) getFlags_ self
    fun stop self = (GioTestDBusClass.FFI.withPtr false ---> I) stop_ self
    fun up self = (GioTestDBusClass.FFI.withPtr false ---> I) up_ self
    local
      open ValueAccessor
    in
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioTestDBusFlags.t (),
          get = fn x => fn () => C.get GioTestDBusFlags.t x,
          set = ignore,
          init = fn x => C.set GioTestDBusFlags.t x
        }
    end
  end
