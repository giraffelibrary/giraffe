signature G_OBJECT_VALUE =
  sig
    type t
    type 'a object_class
    type 'a param_spec_class
    type type_t
    val getType : unit -> type_t
    val copy :
      t
       -> t
       -> unit
    val dupObject : t -> base object_class
    val dupString : t -> string
    val dupVariant : t -> GLib.VariantRecord.t
    val fitsPointer : t -> bool
    val getBoolean : t -> bool
    val getChar : t -> char
    val getDouble : t -> real
    val getEnum : t -> LargeInt.int
    val getFlags : t -> LargeInt.int
    val getFloat : t -> real
    val getGtype : t -> type_t
    val getInt : t -> LargeInt.int
    val getInt64 : t -> LargeInt.int
    val getLong : t -> LargeInt.int
    val getObject : t -> base object_class
    val getParam : t -> base param_spec_class
    val getSchar : t -> LargeInt.int
    val getString : t -> string
    val getUchar : t -> Word8.word
    val getUint : t -> LargeInt.int
    val getUint64 : t -> LargeInt.int
    val getUlong : t -> LargeInt.int
    val getVariant : t -> GLib.VariantRecord.t
    val init :
      t
       -> type_t
       -> t
    val reset : t -> t
    val setBoolean :
      t
       -> bool
       -> unit
    val setChar :
      t
       -> char
       -> unit
    val setDouble :
      t
       -> real
       -> unit
    val setEnum :
      t
       -> LargeInt.int
       -> unit
    val setFlags :
      t
       -> LargeInt.int
       -> unit
    val setFloat :
      t
       -> real
       -> unit
    val setGtype :
      t
       -> type_t
       -> unit
    val setInt :
      t
       -> LargeInt.int
       -> unit
    val setInt64 :
      t
       -> LargeInt.int
       -> unit
    val setLong :
      t
       -> LargeInt.int
       -> unit
    val setObject :
      t
       -> 'a object_class option
       -> unit
    val setParam :
      t
       -> 'a param_spec_class option
       -> unit
    val setSchar :
      t
       -> LargeInt.int
       -> unit
    val setStaticString :
      t
       -> string option
       -> unit
    val setString :
      t
       -> string option
       -> unit
    val setStringTakeOwnership :
      t
       -> string option
       -> unit
    val setUchar :
      t
       -> Word8.word
       -> unit
    val setUint :
      t
       -> LargeInt.int
       -> unit
    val setUint64 :
      t
       -> LargeInt.int
       -> unit
    val setUlong :
      t
       -> LargeInt.int
       -> unit
    val setVariant :
      t
       -> GLib.VariantRecord.t option
       -> unit
    val takeString :
      t
       -> string option
       -> unit
    val takeVariant :
      t
       -> GLib.VariantRecord.t option
       -> unit
    val transform :
      t
       -> t
       -> bool
    val unset : t -> unit
    val typeCompatible : type_t * type_t -> bool
    val typeTransformable : type_t * type_t -> bool
  end
