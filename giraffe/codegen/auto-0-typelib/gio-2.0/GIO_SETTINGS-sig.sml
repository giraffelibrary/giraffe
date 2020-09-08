signature GIO_SETTINGS =
  sig
    type 'a class
    type settings_backend_t
    type settings_bind_flags_t
    type 'a action_class
    type settings_schema_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newFull :
      settings_schema_t
       * settings_backend_t option
       * string option
       -> base class
    val newWithBackend : string * settings_backend_t -> base class
    val newWithBackendAndPath :
      string
       * settings_backend_t
       * string
       -> base class
    val newWithPath : string * string -> base class
    val listRelocatableSchemas : unit -> Utf8CPtrArray.t
    val listSchemas : unit -> Utf8CPtrArray.t
    val sync : unit -> unit
    val unbind : 'a GObject.ObjectClass.class * string -> unit
    val apply : 'a class -> unit
    val bind :
      'a class
       -> string
           * 'b GObject.ObjectClass.class
           * string
           * settings_bind_flags_t
       -> unit
    val bindWritable :
      'a class
       -> string
           * 'b GObject.ObjectClass.class
           * string
           * bool
       -> unit
    val createAction :
      'a class
       -> string
       -> base action_class
    val delay : 'a class -> unit
    val getBoolean :
      'a class
       -> string
       -> bool
    val getChild :
      'a class
       -> string
       -> base class
    val getDefaultValue :
      'a class
       -> string
       -> GLib.VariantRecord.t option
    val getDouble :
      'a class
       -> string
       -> real
    val getEnum :
      'a class
       -> string
       -> LargeInt.int
    val getFlags :
      'a class
       -> string
       -> LargeInt.int
    val getHasUnapplied : 'a class -> bool
    val getInt :
      'a class
       -> string
       -> LargeInt.int
    val getInt64 :
      'a class
       -> string
       -> LargeInt.int
    val getRange :
      'a class
       -> string
       -> GLib.VariantRecord.t
    val getString :
      'a class
       -> string
       -> string
    val getStrv :
      'a class
       -> string
       -> Utf8CPtrArray.t
    val getUint :
      'a class
       -> string
       -> LargeInt.int
    val getUint64 :
      'a class
       -> string
       -> LargeInt.int
    val getUserValue :
      'a class
       -> string
       -> GLib.VariantRecord.t option
    val getValue :
      'a class
       -> string
       -> GLib.VariantRecord.t
    val isWritable :
      'a class
       -> string
       -> bool
    val listChildren : 'a class -> Utf8CPtrArray.t
    val listKeys : 'a class -> Utf8CPtrArray.t
    val rangeCheck :
      'a class
       -> string * GLib.VariantRecord.t
       -> bool
    val reset :
      'a class
       -> string
       -> unit
    val revert : 'a class -> unit
    val setBoolean :
      'a class
       -> string * bool
       -> bool
    val setDouble :
      'a class
       -> string * real
       -> bool
    val setEnum :
      'a class
       -> string * LargeInt.int
       -> bool
    val setFlags :
      'a class
       -> string * LargeInt.int
       -> bool
    val setInt :
      'a class
       -> string * LargeInt.int
       -> bool
    val setInt64 :
      'a class
       -> string * LargeInt.int
       -> bool
    val setString :
      'a class
       -> string * string
       -> bool
    val setStrv :
      'a class
       -> string * Utf8CPtrArray.t option
       -> bool
    val setUint :
      'a class
       -> string * LargeInt.int
       -> bool
    val setUint64 :
      'a class
       -> string * LargeInt.int
       -> bool
    val setValue :
      'a class
       -> string * GLib.VariantRecord.t
       -> bool
    val changeEventSig : (GUInt32CArrayN.t option -> bool) -> 'a class Signal.t
    val changedSig : (string -> unit) -> 'a class Signal.t
    val writableChangeEventSig : (LargeInt.int -> bool) -> 'a class Signal.t
    val writableChangedSig : (string -> unit) -> 'a class Signal.t
    val delayApplyProp : ('a class, unit -> bool, unit, unit) Property.t
    val hasUnappliedProp : ('a class, unit -> bool, unit, unit) Property.t
    val pathProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val schemaProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val schemaIdProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val settingsSchemaProp : ('a class, unit -> settings_schema_t option, unit, settings_schema_t option -> unit) Property.t
  end
