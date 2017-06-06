signature GIO_D_BUS_INTERFACE_INFO =
  sig
    type t
    type d_bus_method_info_t
    type d_bus_property_info_t
    type d_bus_signal_info_t
    val getType : unit -> GObject.Type.t
    val cacheBuild : t -> unit
    val cacheRelease : t -> unit
    val generateXml :
      t
       -> LargeInt.int
       -> GLib.StringRecord.t
       -> unit
    val lookupMethod :
      t
       -> string
       -> d_bus_method_info_t
    val lookupProperty :
      t
       -> string
       -> d_bus_property_info_t
    val lookupSignal :
      t
       -> string
       -> d_bus_signal_info_t
  end
