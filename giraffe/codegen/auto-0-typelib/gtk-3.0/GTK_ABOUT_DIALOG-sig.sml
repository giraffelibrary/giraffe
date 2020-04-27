signature GTK_ABOUT_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type license_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addCreditSection :
      'a class
       -> string * Utf8CPtrArray.t
       -> unit
    val getArtists : 'a class -> Utf8CPtrArray.t
    val getAuthors : 'a class -> Utf8CPtrArray.t
    val getComments : 'a class -> string
    val getCopyright : 'a class -> string
    val getDocumenters : 'a class -> Utf8CPtrArray.t
    val getLicense : 'a class -> string
    val getLicenseType : 'a class -> license_t
    val getLogo : 'a class -> base GdkPixbuf.PixbufClass.class
    val getLogoIconName : 'a class -> string
    val getProgramName : 'a class -> string
    val getTranslatorCredits : 'a class -> string
    val getVersion : 'a class -> string
    val getWebsite : 'a class -> string
    val getWebsiteLabel : 'a class -> string
    val getWrapLicense : 'a class -> bool
    val setArtists :
      'a class
       -> Utf8CPtrArray.t
       -> unit
    val setAuthors :
      'a class
       -> Utf8CPtrArray.t
       -> unit
    val setComments :
      'a class
       -> string option
       -> unit
    val setCopyright :
      'a class
       -> string option
       -> unit
    val setDocumenters :
      'a class
       -> Utf8CPtrArray.t
       -> unit
    val setLicense :
      'a class
       -> string option
       -> unit
    val setLicenseType :
      'a class
       -> license_t
       -> unit
    val setLogo :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setLogoIconName :
      'a class
       -> string option
       -> unit
    val setProgramName :
      'a class
       -> string
       -> unit
    val setTranslatorCredits :
      'a class
       -> string option
       -> unit
    val setVersion :
      'a class
       -> string option
       -> unit
    val setWebsite :
      'a class
       -> string option
       -> unit
    val setWebsiteLabel :
      'a class
       -> string
       -> unit
    val setWrapLicense :
      'a class
       -> bool
       -> unit
    val activateLinkSig : (string -> bool) -> 'a class Signal.t
    val commentsProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val copyrightProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val licenseProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val licenseTypeProp :
      {
        get : 'a class -> license_t,
        set :
          license_t
           -> 'a class
           -> unit,
        new : license_t -> 'a class Property.t
      }
    val logoProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val logoIconNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val programNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val translatorCreditsProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val versionProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val websiteProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val websiteLabelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val wrapLicenseProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
