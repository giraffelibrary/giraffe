structure GioSocketControlMessageClass :>
  GIO_SOCKET_CONTROL_MESSAGE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a socketcontrolmessage = unit
    type 'a t = 'a socketcontrolmessage GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
