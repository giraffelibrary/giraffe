structure GLibKeyFile :>
  G_LIB_KEY_FILE
    where type t = GLibKeyFileRecord.t
    where type bytes_t = GLibBytesRecord.t
    where type key_file_flags_t = GLibKeyFileFlags.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GDoubleCVectorNType =
      CValueCVectorNType(
        structure CElemType = GDoubleType
        structure ElemSequence = CValueVectorSequence(GDoubleType)
      )
    structure GDoubleCVectorN = CVectorN(GDoubleCVectorNType)
    structure GBoolCVectorNType =
      CValueCVectorNType(
        structure CElemType = GBoolType
        structure ElemSequence = CValueVectorSequence(GBoolType)
      )
    structure GBoolCVectorN = CVectorN(GBoolCVectorNType)
    val getType_ = _import "g_key_file_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_key_file_new" : unit -> GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p;
    val getBoolean_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_boolean" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getBooleanList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_get_boolean_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBoolCVectorN.FFI.notnull GBoolCVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getComment_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_comment" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDouble_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_double" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GDouble.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDoubleList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_get_double_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GDoubleCVectorN.FFI.notnull GDoubleCVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getGroups_ = fn x1 & x2 => (_import "g_key_file_get_groups" : GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p * GSize.FFI.ref_ -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;) (x1, x2)
    val getInt64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_int64" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getInteger_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_integer" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getIntegerList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_get_integer_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GIntCVectorN.FFI.notnull GIntCVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getKeys_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_key_file_get_keys" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getLocaleString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_get_locale_string" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getLocaleStringList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_g_key_file_get_locale_string_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val getStartGroup_ = _import "g_key_file_get_start_group" : GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_string" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getStringList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_get_string_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getUint64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_uint64" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_value" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val hasGroup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_key_file_has_group" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFromBytes_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_key_file_load_from_bytes" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p
               * GLibKeyFileFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFromData_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_key_file_load_from_data" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.val_
               * GLibKeyFileFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val loadFromDataDirs_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_load_from_data_dirs" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * GLibKeyFileFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val loadFromDirs_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_g_key_file_load_from_dirs" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * GLibKeyFileFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val loadFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_key_file_load_from_file" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibKeyFileFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val removeComment_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_remove_comment" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val removeGroup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_key_file_remove_group" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeKey_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_remove_key" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val saveToFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_key_file_save_to_file" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setBoolean_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_boolean" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setBooleanList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_set_boolean_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBoolCVectorN.MLton.p1
               * GBoolCVectorN.FFI.notnull GBoolCVectorN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setComment_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_set_comment" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setDouble_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_double" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setDoubleList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_set_double_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GDoubleCVectorN.MLton.p1
               * GDoubleCVectorN.FFI.notnull GDoubleCVectorN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setInt64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_int64" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setInteger_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_integer" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setIntegerList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_set_integer_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GIntCVectorN.MLton.p1
               * GIntCVectorN.FFI.notnull GIntCVectorN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setListSeparator_ = fn x1 & x2 => (_import "g_key_file_set_list_separator" : GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p * GChar.FFI.val_ -> unit;) (x1, x2)
    val setLocaleString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_key_file_set_locale_string" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val setLocaleStringList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10 =>
          (
            _import "mlton_g_key_file_set_locale_string_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val setString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7) =>
          (
            _import "mlton_g_key_file_set_string" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setStringList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_set_string_list" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setUint64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_uint64" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7) =>
          (
            _import "mlton_g_key_file_set_value" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val toData_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_key_file_to_data" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibKeyFileRecord.t
    type bytes_t = GLibBytesRecord.t
    type key_file_flags_t = GLibKeyFileFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibKeyFileRecord.FFI.fromPtr true) new_ ()
    fun getBoolean self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        getBoolean_
        (
          self
           & groupName
           & key
           & []
        )
    fun getBooleanList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GBoolCVectorN.FFI.fromPtr 1
          )
            getBooleanList_
            (
              self
               & groupName
               & key
               & GSize.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getComment self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getComment_
        (
          self
           & groupName
           & key
           & []
        )
    fun getDouble self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GDouble.FFI.fromVal
      )
        getDouble_
        (
          self
           & groupName
           & key
           & []
        )
    fun getDoubleList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GDoubleCVectorN.FFI.fromPtr 1
          )
            getDoubleList_
            (
              self
               & groupName
               & key
               & GSize.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getGroups self =
      let
        val length & retVal = (GLibKeyFileRecord.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CVector.FFI.fromPtr 2) getGroups_ (self & GSize.null)
      in
        (retVal, length)
      end
    fun getInt64 self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        getInt64_
        (
          self
           & groupName
           & key
           & []
        )
    fun getInteger self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        getInteger_
        (
          self
           & groupName
           & key
           & []
        )
    fun getIntegerList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GIntCVectorN.FFI.fromPtr 1
          )
            getIntegerList_
            (
              self
               & groupName
               & key
               & GSize.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getKeys self groupName =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8CVector.FFI.fromPtr 2
          )
            getKeys_
            (
              self
               & groupName
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun getLocaleString
      self
      (
        groupName,
        key,
        locale
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getLocaleString_
        (
          self
           & groupName
           & key
           & locale
           & []
        )
    fun getLocaleStringList
      self
      (
        groupName,
        key,
        locale
      ) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2
          )
            getLocaleStringList_
            (
              self
               & groupName
               & key
               & locale
               & GSize.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getStartGroup self = (GLibKeyFileRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getStartGroup_ self
    fun getString self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getString_
        (
          self
           & groupName
           & key
           & []
        )
    fun getStringList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2
          )
            getStringList_
            (
              self
               & groupName
               & key
               & GSize.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getUint64 self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt64.FFI.fromVal
      )
        getUint64_
        (
          self
           & groupName
           & key
           & []
        )
    fun getValue self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getValue_
        (
          self
           & groupName
           & key
           & []
        )
    fun hasGroup self groupName = (GLibKeyFileRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasGroup_ (self & groupName)
    fun loadFromBytes self (bytes, flags) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GLibKeyFileFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromBytes_
        (
          self
           & bytes
           & flags
           & []
        )
    fun loadFromData
      self
      (
        data,
        length,
        flags
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GLibKeyFileFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromData_
        (
          self
           & data
           & length
           & flags
           & []
        )
    fun loadFromDataDirs self (file, flags) =
      let
        val fullPath & () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibKeyFileFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && ignore
          )
            loadFromDataDirs_
            (
              self
               & file
               & NONE
               & flags
               & []
            )
      in
        fullPath
      end
    fun loadFromDirs
      self
      (
        file,
        searchDirs,
        flags
      ) =
      let
        val fullPath & () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8CVector.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibKeyFileFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && ignore
          )
            loadFromDirs_
            (
              self
               & file
               & searchDirs
               & NONE
               & flags
               & []
            )
      in
        fullPath
      end
    fun loadFromFile self (file, flags) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibKeyFileFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromFile_
        (
          self
           & file
           & flags
           & []
        )
    fun removeComment self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeComment_
        (
          self
           & groupName
           & key
           & []
        )
    fun removeGroup self groupName =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeGroup_
        (
          self
           & groupName
           & []
        )
    fun removeKey self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeKey_
        (
          self
           & groupName
           & key
           & []
        )
    fun saveToFile self filename =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        saveToFile_
        (
          self
           & filename
           & []
        )
    fun setBoolean
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setBoolean_
        (
          self
           & groupName
           & key
           & value
        )
    fun setBooleanList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (GBoolCVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GBoolCVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             ---> I
          )
            setBooleanList_
            (
              self
               & groupName
               & key
               & list
               & length
            )
      in
        ()
      end
    fun setComment
      self
      (
        groupName,
        key,
        comment
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setComment_
        (
          self
           & groupName
           & key
           & comment
           & []
        )
    fun setDouble
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setDouble_
        (
          self
           & groupName
           & key
           & value
        )
    fun setDoubleList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (GDoubleCVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GDoubleCVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             ---> I
          )
            setDoubleList_
            (
              self
               & groupName
               & key
               & list
               & length
            )
      in
        ()
      end
    fun setInt64
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         ---> I
      )
        setInt64_
        (
          self
           & groupName
           & key
           & value
        )
    fun setInteger
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setInteger_
        (
          self
           & groupName
           & key
           & value
        )
    fun setIntegerList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (GIntCVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GIntCVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             ---> I
          )
            setIntegerList_
            (
              self
               & groupName
               & key
               & list
               & length
            )
      in
        ()
      end
    fun setListSeparator self separator = (GLibKeyFileRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> I) setListSeparator_ (self & separator)
    fun setLocaleString
      self
      (
        groupName,
        key,
        locale,
        string
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setLocaleString_
        (
          self
           & groupName
           & key
           & locale
           & string
        )
    fun setLocaleStringList
      self
      (
        groupName,
        key,
        locale,
        list
      ) =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             ---> I
          )
            setLocaleStringList_
            (
              self
               & groupName
               & key
               & locale
               & list
               & length
            )
      in
        ()
      end
    fun setString
      self
      (
        groupName,
        key,
        string
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setString_
        (
          self
           & groupName
           & key
           & string
        )
    fun setStringList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             ---> I
          )
            setStringList_
            (
              self
               & groupName
               & key
               & list
               & length
            )
      in
        ()
      end
    fun setUint64
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         ---> I
      )
        setUint64_
        (
          self
           & groupName
           & key
           & value
        )
    fun setValue
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setValue_
        (
          self
           & groupName
           & key
           & value
        )
    fun toData self =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            toData_
            (
              self
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
  end
