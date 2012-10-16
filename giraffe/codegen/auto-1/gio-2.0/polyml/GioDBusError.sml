structure GioDBusError :>
  sig
    include GIO_D_BUS_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      FAILED
    | NOMEMORY
    | SERVICEUNKNOWN
    | NAMEHASNOOWNER
    | NOREPLY
    | IOERROR
    | BADADDRESS
    | NOTSUPPORTED
    | LIMITSEXCEEDED
    | ACCESSDENIED
    | AUTHFAILED
    | NOSERVER
    | TIMEOUT
    | NONETWORK
    | ADDRESSINUSE
    | DISCONNECTED
    | INVALIDARGS
    | FILENOTFOUND
    | FILEEXISTS
    | UNKNOWNMETHOD
    | TIMEDOUT
    | MATCHRULENOTFOUND
    | MATCHRULEINVALID
    | SPAWNEXECFAILED
    | SPAWNFORKFAILED
    | SPAWNCHILDEXITED
    | SPAWNCHILDSIGNALED
    | SPAWNFAILED
    | SPAWNSETUPFAILED
    | SPAWNCONFIGINVALID
    | SPAWNSERVICEINVALID
    | SPAWNSERVICENOTFOUND
    | SPAWNPERMISSIONSINVALID
    | SPAWNFILEINVALID
    | SPAWNNOMEMORY
    | UNIXPROCESSIDUNKNOWN
    | INVALIDSIGNATURE
    | INVALIDFILECONTENT
    | SELINUXSECURITYCONTEXTUNKNOWN
    | ADTAUDITDATAUNKNOWN
    | OBJECTPATHINUSE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            FAILED => f 0
          | NOMEMORY => f 1
          | SERVICEUNKNOWN => f 2
          | NAMEHASNOOWNER => f 3
          | NOREPLY => f 4
          | IOERROR => f 5
          | BADADDRESS => f 6
          | NOTSUPPORTED => f 7
          | LIMITSEXCEEDED => f 8
          | ACCESSDENIED => f 9
          | AUTHFAILED => f 10
          | NOSERVER => f 11
          | TIMEOUT => f 12
          | NONETWORK => f 13
          | ADDRESSINUSE => f 14
          | DISCONNECTED => f 15
          | INVALIDARGS => f 16
          | FILENOTFOUND => f 17
          | FILEEXISTS => f 18
          | UNKNOWNMETHOD => f 19
          | TIMEDOUT => f 20
          | MATCHRULENOTFOUND => f 21
          | MATCHRULEINVALID => f 22
          | SPAWNEXECFAILED => f 23
          | SPAWNFORKFAILED => f 24
          | SPAWNCHILDEXITED => f 25
          | SPAWNCHILDSIGNALED => f 26
          | SPAWNFAILED => f 27
          | SPAWNSETUPFAILED => f 28
          | SPAWNCONFIGINVALID => f 29
          | SPAWNSERVICEINVALID => f 30
          | SPAWNSERVICENOTFOUND => f 31
          | SPAWNPERMISSIONSINVALID => f 32
          | SPAWNFILEINVALID => f 33
          | SPAWNNOMEMORY => f 34
          | UNIXPROCESSIDUNKNOWN => f 35
          | INVALIDSIGNATURE => f 36
          | INVALIDFILECONTENT => f 37
          | SELINUXSECURITYCONTEXTUNKNOWN => f 38
          | ADTAUDITDATAUNKNOWN => f 39
          | OBJECTPATHINUSE => f 40
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => NOMEMORY
          | 2 => SERVICEUNKNOWN
          | 3 => NAMEHASNOOWNER
          | 4 => NOREPLY
          | 5 => IOERROR
          | 6 => BADADDRESS
          | 7 => NOTSUPPORTED
          | 8 => LIMITSEXCEEDED
          | 9 => ACCESSDENIED
          | 10 => AUTHFAILED
          | 11 => NOSERVER
          | 12 => TIMEOUT
          | 13 => NONETWORK
          | 14 => ADDRESSINUSE
          | 15 => DISCONNECTED
          | 16 => INVALIDARGS
          | 17 => FILENOTFOUND
          | 18 => FILEEXISTS
          | 19 => UNKNOWNMETHOD
          | 20 => TIMEDOUT
          | 21 => MATCHRULENOTFOUND
          | 22 => MATCHRULEINVALID
          | 23 => SPAWNEXECFAILED
          | 24 => SPAWNFORKFAILED
          | 25 => SPAWNCHILDEXITED
          | 26 => SPAWNCHILDSIGNALED
          | 27 => SPAWNFAILED
          | 28 => SPAWNSETUPFAILED
          | 29 => SPAWNCONFIGINVALID
          | 30 => SPAWNSERVICEINVALID
          | 31 => SPAWNSERVICENOTFOUND
          | 32 => SPAWNPERMISSIONSINVALID
          | 33 => SPAWNFILEINVALID
          | 34 => SPAWNNOMEMORY
          | 35 => UNIXPROCESSIDUNKNOWN
          | 36 => INVALIDSIGNATURE
          | 37 => INVALIDFILECONTENT
          | 38 => SELINUXSECURITYCONTEXTUNKNOWN
          | 39 => ADTAUDITDATAUNKNOWN
          | 40 => OBJECTPATHINUSE
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = FAILED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
