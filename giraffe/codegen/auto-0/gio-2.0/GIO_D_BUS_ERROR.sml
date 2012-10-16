signature GIO_D_BUS_ERROR =
  sig
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
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end
