signature GIO_TEST_D_BUS =
  sig
    type 'a class
    type test_d_bus_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : test_d_bus_flags_t -> base class
    val unset : unit -> unit
    val addServiceDir :
      'a class
       -> string
       -> unit
    val down : 'a class -> unit
    val getBusAddress : 'a class -> string
    val getFlags : 'a class -> test_d_bus_flags_t
    val stop : 'a class -> unit
    val up : 'a class -> unit
    val flagsProp : ('a class, test_d_bus_flags_t, test_d_bus_flags_t) Property.readwrite
  end
