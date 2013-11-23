(* The GLibQuark module is an artificially introduced interface for GQuarks.
 * The current plan is to hide GQuark types behind the SML bindings.
 * Consequently, the GQuark-related functions such as g_quark_from_string and
 * g_quark_to_string are provided in this module to allow their use by
 * subsequent modules that convert to/from GQuarks.  Although the GIR metadata
 * would cause such functions to appear in the namespace module as
 * `GLib.quarkFromString` and `GLib.quarkToString`, this is not considered an
 * issue as applications should not really need to use GQuark values.  Also,
 * the GIR metadata would give `fromString : string option -> t` but we do
 * not want to allow an optional string so that our interface does not allow
 * null GQuark values.
 *)
signature G_LIB_QUARK =
  sig
    eqtype t

    val fromString : string -> t
    val toString : t -> string

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
      end
  end
