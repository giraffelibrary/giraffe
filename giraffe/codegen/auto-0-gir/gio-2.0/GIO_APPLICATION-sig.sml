signature GIO_APPLICATION =
  sig
    type 'a class
    type 'a action_map_class
    type 'a d_bus_connection_class
    type 'a cancellable_class
    type 'a notification_class
    type 'a application_command_line_class
    type file_class_c_ptr_array_n_t
    type 'a action_group_class
    type application_flags_t
    type t = base class
    val asActionGroup : 'a class -> base action_group_class
    val asActionMap : 'a class -> base action_map_class
    val getType : unit -> GObject.Type.t
    val new : string option * application_flags_t -> base class
    val getDefault : unit -> base class
    val idIsValid : string -> bool
    val activate : 'a class -> unit
    val addMainOption :
      'a class
       -> string
           * char
           * GLib.OptionFlags.t
           * GLib.OptionArg.t
           * string
           * string option
       -> unit
    val addOptionGroup :
      'a class
       -> GLib.OptionGroupRecord.t
       -> unit
    val bindBusyProperty :
      'a class
       -> 'b GObject.ObjectClass.class * string
       -> unit
    val getApplicationId : 'a class -> string
    val getDbusConnection : 'a class -> base d_bus_connection_class
    val getDbusObjectPath : 'a class -> string
    val getFlags : 'a class -> application_flags_t
    val getInactivityTimeout : 'a class -> LargeInt.int
    val getIsBusy : 'a class -> bool
    val getIsRegistered : 'a class -> bool
    val getIsRemote : 'a class -> bool
    val getResourceBasePath : 'a class -> string option
    val hold : 'a class -> unit
    val markBusy : 'a class -> unit
    val open' :
      'a class
       -> file_class_c_ptr_array_n_t * string
       -> unit
    val quit : 'a class -> unit
    val register :
      'a class
       -> 'b cancellable_class option
       -> unit
    val release : 'a class -> unit
    val run :
      'a class
       -> Utf8CPtrArrayN.t option
       -> LargeInt.int
    val sendNotification :
      'a class
       -> string option * 'b notification_class
       -> unit
    val setActionGroup :
      'a class
       -> 'b action_group_class option
       -> unit
    val setApplicationId :
      'a class
       -> string option
       -> unit
    val setDefault : 'a class -> unit
    val setFlags :
      'a class
       -> application_flags_t
       -> unit
    val setInactivityTimeout :
      'a class
       -> LargeInt.int
       -> unit
    val setResourceBasePath :
      'a class
       -> string option
       -> unit
    val unbindBusyProperty :
      'a class
       -> 'b GObject.ObjectClass.class * string
       -> unit
    val unmarkBusy : 'a class -> unit
    val withdrawNotification :
      'a class
       -> string
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val commandLineSig : (base application_command_line_class -> LargeInt.int) -> 'a class Signal.t
    val handleLocalOptionsSig : (GLib.VariantDictRecord.t -> LargeInt.int) -> 'a class Signal.t
    val openSig : (file_class_c_ptr_array_n_t * string -> unit) -> 'a class Signal.t
    val shutdownSig : (unit -> unit) -> 'a class Signal.t
    val startupSig : (unit -> unit) -> 'a class Signal.t
    val actionGroupProp : ('a class, unit, 'b action_group_class option -> unit, 'b action_group_class option -> unit) Property.t
    val applicationIdProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val flagsProp : ('a class, unit -> application_flags_t, application_flags_t -> unit, application_flags_t -> unit) Property.t
    val inactivityTimeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val isBusyProp : ('a class, unit -> bool, unit, unit) Property.t
    val isRegisteredProp : ('a class, unit -> bool, unit, unit) Property.t
    val isRemoteProp : ('a class, unit -> bool, unit, unit) Property.t
    val resourceBasePathProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
