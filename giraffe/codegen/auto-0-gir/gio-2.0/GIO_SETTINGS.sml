signature GIO_SETTINGS =
  sig
    type 'a class_t
    type settingsbackendrecord_t
    type settingsbindflags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val newWithBackend :
      string
       -> settingsbackendrecord_t
       -> base class_t
    val newWithBackendAndPath :
      string
       -> settingsbackendrecord_t
       -> string
       -> base class_t
    val newWithPath :
      string
       -> string
       -> base class_t
    val sync : unit -> unit
    val apply : 'a class_t -> unit
    val bind :
      'a class_t
       -> string
       -> 'b GObject.ObjectClass.t
       -> string
       -> settingsbindflags_t
       -> unit
    val bindWritable :
      'a class_t
       -> string
       -> 'b GObject.ObjectClass.t
       -> string
       -> bool
       -> unit
    val delay : 'a class_t -> unit
    val getBoolean :
      'a class_t
       -> string
       -> bool
    val getChild :
      'a class_t
       -> string
       -> base class_t
    val getDouble :
      'a class_t
       -> string
       -> real
    val getEnum :
      'a class_t
       -> string
       -> LargeInt.int
    val getFlags :
      'a class_t
       -> string
       -> LargeInt.int
    val getHasUnapplied : 'a class_t -> bool
    val getInt :
      'a class_t
       -> string
       -> LargeInt.int
    val getRange :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
    val getString :
      'a class_t
       -> string
       -> string
    val getUint :
      'a class_t
       -> string
       -> LargeInt.int
    val getValue :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
    val isWritable :
      'a class_t
       -> string
       -> bool
    val rangeCheck :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
       -> bool
    val reset :
      'a class_t
       -> string
       -> unit
    val revert : 'a class_t -> unit
    val setBoolean :
      'a class_t
       -> string
       -> bool
       -> bool
    val setDouble :
      'a class_t
       -> string
       -> real
       -> bool
    val setEnum :
      'a class_t
       -> string
       -> LargeInt.int
       -> bool
    val setFlags :
      'a class_t
       -> string
       -> LargeInt.int
       -> bool
    val setInt :
      'a class_t
       -> string
       -> LargeInt.int
       -> bool
    val setString :
      'a class_t
       -> string
       -> string
       -> bool
    val setUint :
      'a class_t
       -> string
       -> LargeInt.int
       -> bool
    val setValue :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
       -> bool
    val changedSig : (string -> unit) -> 'a class_t Signal.signal
    val writableChangeEventSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val writableChangedSig : (string -> unit) -> 'a class_t Signal.signal
    val delayApplyProp : ('a class_t, bool) Property.readonly
    val hasUnappliedProp : ('a class_t, bool) Property.readonly
    val pathProp : ('a class_t, string option, string option) Property.readwrite
    val schemaProp : ('a class_t, string option, string option) Property.readwrite
  end
