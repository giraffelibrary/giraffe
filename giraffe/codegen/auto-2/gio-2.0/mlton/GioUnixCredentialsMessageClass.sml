structure GioUnixCredentialsMessageClass :>
  GIO_UNIX_CREDENTIALS_MESSAGE_CLASS
    where type 'a socketcontrolmessageclass_t = 'a GioSocketControlMessageClass.t
    where type C.notnull = GioSocketControlMessageClass.C.notnull
    where type 'a C.p = 'a GioSocketControlMessageClass.C.p =
  struct
    type 'a unixcredentialsmessage = unit
    type 'a socketcontrolmessageclass_t = 'a GioSocketControlMessageClass.t
    type 'a t = 'a unixcredentialsmessage socketcontrolmessageclass_t
    fun toBase obj = obj
    val t = GioSocketControlMessageClass.t
    val tOpt = GioSocketControlMessageClass.tOpt
    structure C = GioSocketControlMessageClass.C
  end
