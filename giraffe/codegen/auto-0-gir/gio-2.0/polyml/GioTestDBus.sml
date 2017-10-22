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
      val getBusAddress_ = call (getSymbol "g_test_dbus_get_bus_address") (GioTestDBusClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
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
    fun addServiceDir self path = (GioTestDBusClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addServiceDir_ (self & path)
    fun down self = (GioTestDBusClass.FFI.withPtr ---> I) down_ self
    fun getBusAddress self = (GioTestDBusClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getBusAddress_ self
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
