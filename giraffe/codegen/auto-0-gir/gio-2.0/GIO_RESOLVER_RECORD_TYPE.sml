signature GIO_RESOLVER_RECORD_TYPE =
  sig
    datatype enum =
      SRV
    | MX
    | TXT
    | SOA
    | NS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
