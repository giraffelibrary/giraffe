signature GIO_FILE_ATTRIBUTE_INFO_LIST =
  sig
    type t
    type file_attribute_info_flags_t
    type file_attribute_type_t
    type file_attribute_info_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val add :
      t
       -> string
           * file_attribute_type_t
           * file_attribute_info_flags_t
       -> unit
    val dup : t -> t
    val lookup :
      t
       -> string
       -> file_attribute_info_t
  end
