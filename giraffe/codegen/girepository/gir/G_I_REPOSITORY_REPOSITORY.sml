(* This interface differs from the interface in the GIRepository library to
 * provide more capability for working with GIR files.
 * 
 * The main difference is in order to allow multiple versions of the same
 * namespace to be loaded.  With multiple versions of the same namespace, a
 * namespace name does not uniquely identify a typelib.  Therefore the `get*`
 * functions have an extra parameter that maps namespace names to namespace
 * versions.  This map is represented by the type `typelibvers_t`.  Such a
 * map captures the versions of a particular typelib and its dependencies.
 * Therefore, the function `require` is extended to return a `typelibvers_t`
 * value along with the `typelibtype_t` value that it already returns.
 *
 * Unlike the GIRepository library, this interface provides the function
 * `getPackages` to return the package name(s) for a namespace.
 *)
signature G_I_REPOSITORY_REPOSITORY =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type loadflags_t
    type typelibtype_t
    type typelibvers_t
    val extendTypelibVers : (string * string) list -> typelibvers_t -> typelibvers_t
    val getDefault : unit -> base class_t
    val prependSearchPath : 'a class_t -> string -> unit
    val loadTypelib : 'a class_t -> typelibtype_t -> loadflags_t -> string
    val require : 'a class_t -> string -> string -> loadflags_t -> typelibtype_t * typelibvers_t
    val getDependencies : 'a class_t -> typelibvers_t -> string -> string list option
    val getPackages : 'a class_t -> typelibvers_t -> string -> string list
    val getNInfos : 'a class_t -> typelibvers_t -> string -> LargeInt.int
    val getInfo : 'a class_t -> typelibvers_t -> string -> LargeInt.int -> base baseinfoclass_t
    val getSharedLibrary : 'a class_t -> typelibvers_t -> string -> string option
    val getVersion : 'a class_t -> typelibvers_t -> string -> string
    val getCPrefix : 'a class_t -> typelibvers_t -> string -> string option
  end
