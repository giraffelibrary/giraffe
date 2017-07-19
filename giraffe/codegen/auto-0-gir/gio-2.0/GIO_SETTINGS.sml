signature GIO_SETTINGS =
  sig
    type 'a class
    type settings_backend_t
    type settings_bind_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newWithBackend : string * settings_backend_t -> base class
    val newWithBackendAndPath :
      string
       * settings_backend_t
       * string
       -> base class
    val newWithPath : string * string -> base class
    val listRelocatableSchemas : unit -> string list
    val listSchemas : unit -> string list
    val sync : unit -> unit
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
    val delay : 'a class -> unit
    val getBoolean :
      'a class
       -> string
       -> bool
    val getChild :
      'a class
       -> string
       -> base class
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
       -> string list
    val getUint :
      'a class
       -> string
       -> LargeInt.int
    val getValue :
      'a class
       -> string
       -> GLib.VariantRecord.t
    val isWritable :
      'a class
       -> string
       -> bool
    val listChildren : 'a class -> string list
    val listKeys : 'a class -> string list
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
    val setString :
      'a class
       -> string * string
       -> bool
    val setStrv :
      'a class
       -> string * string list option
       -> bool
    val setUint :
      'a class
       -> string * LargeInt.int
       -> bool
    val setValue :
      'a class
       -> string * GLib.VariantRecord.t
       -> bool
    val changeEventSig : (GLib.Quark.t vector option -> bool) -> 'a class Signal.signal
    val changedSig : (string -> unit) -> 'a class Signal.signal
    val writableChangeEventSig : (LargeInt.int -> bool) -> 'a class Signal.signal
    val writableChangedSig : (string -> unit) -> 'a class Signal.signal
    val delayApplyProp : ('a class, bool) Property.readonly
    val hasUnappliedProp : ('a class, bool) Property.readonly
    val pathProp : ('a class, string option, string option) Property.readwrite
    val schemaProp : ('a class, string option, string option) Property.readwrite
  end
