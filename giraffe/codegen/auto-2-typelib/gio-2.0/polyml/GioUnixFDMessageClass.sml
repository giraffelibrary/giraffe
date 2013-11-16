structure GioUnixFDMessageClass :>
  GIO_UNIX_F_D_MESSAGE_CLASS
    where type 'a socketcontrolmessageclass_t = 'a GioSocketControlMessageClass.t
    where type C.notnull = GioSocketControlMessageClass.C.notnull
    where type 'a C.p = 'a GioSocketControlMessageClass.C.p =
  struct
    type 'a unixfdmessage = unit
    type 'a socketcontrolmessageclass_t = 'a GioSocketControlMessageClass.t
    type 'a t = 'a unixfdmessage socketcontrolmessageclass_t
    fun toBase obj = obj
    val t = GioSocketControlMessageClass.t
    val tOpt = GioSocketControlMessageClass.tOpt
    structure C = GioSocketControlMessageClass.C
  end
