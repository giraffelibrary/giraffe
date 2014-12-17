signature GIO_D_BUS_CONNECTION =
  sig
    type 'a class_t
    type 'a asyncinitableclass_t
    type 'a initableclass_t
    type 'a unixfdlistclass_t
    type dbuscallflags_t
    type 'a credentialsclass_t
    type 'a asyncresultclass_t
    type 'a cancellableclass_t
    type dbussendmessageflags_t
    type 'a dbusmessageclass_t
    type 'a dbusauthobserverclass_t
    type dbuscapabilityflags_t
    type dbusconnectionflags_t
    type 'a iostreamclass_t
    type t = base class_t
    val asAsyncInitable : 'a class_t -> base asyncinitableclass_t
    val asInitable : 'a class_t -> base initableclass_t
    val getType : unit -> GObject.Type.t
    val newFinish : 'a asyncresultclass_t -> base class_t
    val newForAddressFinish : 'a asyncresultclass_t -> base class_t
    val newForAddressSync :
      string
       -> dbusconnectionflags_t
       -> 'a dbusauthobserverclass_t option
       -> 'b cancellableclass_t option
       -> base class_t
    val newSync :
      'a iostreamclass_t
       -> string option
       -> dbusconnectionflags_t
       -> 'b dbusauthobserverclass_t option
       -> 'c cancellableclass_t option
       -> base class_t
    val callFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> GLib.VariantRecord.t
    val callSync :
      'a class_t
       -> string
       -> string
       -> string
       -> string
       -> GLib.VariantRecord.t option
       -> GLib.VariantTypeRecord.t option
       -> dbuscallflags_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> GLib.VariantRecord.t
    val callWithUnixFdListFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> GLib.VariantRecord.t * base unixfdlistclass_t
    val callWithUnixFdListSync :
      'a class_t
       -> string
       -> string
       -> string
       -> string
       -> GLib.VariantRecord.t option
       -> GLib.VariantTypeRecord.t option
       -> dbuscallflags_t
       -> LargeInt.int
       -> 'b unixfdlistclass_t option
       -> 'c cancellableclass_t option
       -> GLib.VariantRecord.t * base unixfdlistclass_t
    val closeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val closeSync :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val emitSignal :
      'a class_t
       -> string option
       -> string
       -> string
       -> string
       -> GLib.VariantRecord.t option
       -> bool
    val flushFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val flushSync :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val getCapabilities : 'a class_t -> dbuscapabilityflags_t
    val getExitOnClose : 'a class_t -> bool
    val getGuid : 'a class_t -> string
    val getPeerCredentials : 'a class_t -> base credentialsclass_t
    val getStream : 'a class_t -> base iostreamclass_t
    val getUniqueName : 'a class_t -> string
    val isClosed : 'a class_t -> bool
    val removeFilter :
      'a class_t
       -> LargeInt.int
       -> unit
    val sendMessage :
      'a class_t
       -> 'b dbusmessageclass_t
       -> dbussendmessageflags_t
       -> LargeInt.int option
    val sendMessageWithReplyFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base dbusmessageclass_t
    val sendMessageWithReplySync :
      'a class_t
       -> 'b dbusmessageclass_t
       -> dbussendmessageflags_t
       -> LargeInt.int
       -> 'c cancellableclass_t option
       -> base dbusmessageclass_t * LargeInt.int
    val setExitOnClose :
      'a class_t
       -> bool
       -> unit
    val signalUnsubscribe :
      'a class_t
       -> LargeInt.int
       -> unit
    val startMessageProcessing : 'a class_t -> unit
    val unregisterObject :
      'a class_t
       -> LargeInt.int
       -> bool
    val unregisterSubtree :
      'a class_t
       -> LargeInt.int
       -> bool
    val addressProp : ('a class_t, string option) Property.writeonly
    val authenticationObserverProp : ('a class_t, 'b dbusauthobserverclass_t option) Property.writeonly
    val capabilitiesProp : ('a class_t, dbuscapabilityflags_t) Property.readonly
    val closedProp : ('a class_t, bool) Property.readonly
    val exitOnCloseProp : ('a class_t, bool, bool) Property.readwrite
    val flagsProp : ('a class_t, dbusconnectionflags_t) Property.writeonly
    val guidProp : ('a class_t, string option, string option) Property.readwrite
    val streamProp : ('a class_t, base iostreamclass_t option, 'b iostreamclass_t option) Property.readwrite
    val uniqueNameProp : ('a class_t, string option) Property.readonly
  end
