signature GIO_APPLICATION =
  sig
    type 'a class
    type 'a action_map_class
    type 'a d_bus_connection_class
    type 'a cancellable_class
    type 'a notification_class
    type 'a application_command_line_class
    type 'a file_class
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
           * LargeInt.int
           * GLib.OptionFlags.t
           * GLib.OptionArg.t
           * string
           * string option
       -> unit
    val addMainOptionEntries :
      'a class
       -> GLib.OptionEntryRecord.t vector
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
       -> base file_class vector * string
       -> unit
    val quit : 'a class -> unit
    val register :
      'a class
       -> 'b cancellable_class option
       -> unit
    val release : 'a class -> unit
    val run :
      'a class
       -> string list option
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
    val openSig : (base file_class vector * string -> unit) -> 'a class Signal.t
    val shutdownSig : (unit -> unit) -> 'a class Signal.t
    val startupSig : (unit -> unit) -> 'a class Signal.t
    val actionGroupProp : ('a class, 'b action_group_class option) Property.writeonly
    val applicationIdProp : ('a class, string option, string option) Property.readwrite
    val flagsProp : ('a class, application_flags_t, application_flags_t) Property.readwrite
    val inactivityTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val isBusyProp : ('a class, bool) Property.readonly
    val isRegisteredProp : ('a class, bool) Property.readonly
    val isRemoteProp : ('a class, bool) Property.readonly
    val resourceBasePathProp : ('a class, string option, string option) Property.readwrite
  end
