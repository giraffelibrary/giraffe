structure GtkAboutDialog :>
  GTK_ABOUT_DIALOG
    where type 'a class = 'a GtkAboutDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type license_t = GtkLicense.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_about_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_about_dialog_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addCreditSection_ =
        call (getSymbol "gtk_about_dialog_add_credit_section")
          (
            GtkAboutDialogClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             --> cVoid
          )
      val getArtists_ = call (getSymbol "gtk_about_dialog_get_artists") (GtkAboutDialogClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getAuthors_ = call (getSymbol "gtk_about_dialog_get_authors") (GtkAboutDialogClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getComments_ = call (getSymbol "gtk_about_dialog_get_comments") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCopyright_ = call (getSymbol "gtk_about_dialog_get_copyright") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDocumenters_ = call (getSymbol "gtk_about_dialog_get_documenters") (GtkAboutDialogClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getLicense_ = call (getSymbol "gtk_about_dialog_get_license") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLicenseType_ = call (getSymbol "gtk_about_dialog_get_license_type") (GtkAboutDialogClass.PolyML.cPtr --> GtkLicense.PolyML.cVal)
      val getLogo_ = call (getSymbol "gtk_about_dialog_get_logo") (GtkAboutDialogClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getLogoIconName_ = call (getSymbol "gtk_about_dialog_get_logo_icon_name") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProgramName_ = call (getSymbol "gtk_about_dialog_get_program_name") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTranslatorCredits_ = call (getSymbol "gtk_about_dialog_get_translator_credits") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (getSymbol "gtk_about_dialog_get_version") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWebsite_ = call (getSymbol "gtk_about_dialog_get_website") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWebsiteLabel_ = call (getSymbol "gtk_about_dialog_get_website_label") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWrapLicense_ = call (getSymbol "gtk_about_dialog_get_wrap_license") (GtkAboutDialogClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setArtists_ = call (getSymbol "gtk_about_dialog_set_artists") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8CPtrArray.PolyML.cInPtr --> cVoid)
      val setAuthors_ = call (getSymbol "gtk_about_dialog_set_authors") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8CPtrArray.PolyML.cInPtr --> cVoid)
      val setComments_ = call (getSymbol "gtk_about_dialog_set_comments") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setCopyright_ = call (getSymbol "gtk_about_dialog_set_copyright") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setDocumenters_ = call (getSymbol "gtk_about_dialog_set_documenters") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8CPtrArray.PolyML.cInPtr --> cVoid)
      val setLicense_ = call (getSymbol "gtk_about_dialog_set_license") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setLicenseType_ = call (getSymbol "gtk_about_dialog_set_license_type") (GtkAboutDialogClass.PolyML.cPtr &&> GtkLicense.PolyML.cVal --> cVoid)
      val setLogo_ = call (getSymbol "gtk_about_dialog_set_logo") (GtkAboutDialogClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> cVoid)
      val setLogoIconName_ = call (getSymbol "gtk_about_dialog_set_logo_icon_name") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setProgramName_ = call (getSymbol "gtk_about_dialog_set_program_name") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTranslatorCredits_ = call (getSymbol "gtk_about_dialog_set_translator_credits") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setVersion_ = call (getSymbol "gtk_about_dialog_set_version") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setWebsite_ = call (getSymbol "gtk_about_dialog_set_website") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setWebsiteLabel_ = call (getSymbol "gtk_about_dialog_set_website_label") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setWrapLicense_ = call (getSymbol "gtk_about_dialog_set_wrap_license") (GtkAboutDialogClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkAboutDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type license_t = GtkLicense.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAboutDialogClass.FFI.fromPtr false) new_ ()
    fun addCreditSection self (sectionName, people) =
      (
        GtkAboutDialogClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         ---> I
      )
        addCreditSection_
        (
          self
           & sectionName
           & people
        )
    fun getArtists self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getArtists_ self
    fun getAuthors self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getAuthors_ self
    fun getComments self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getComments_ self
    fun getCopyright self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCopyright_ self
    fun getDocumenters self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getDocumenters_ self
    fun getLicense self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLicense_ self
    fun getLicenseType self = (GtkAboutDialogClass.FFI.withPtr false ---> GtkLicense.FFI.fromVal) getLicenseType_ self
    fun getLogo self = (GtkAboutDialogClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getLogo_ self
    fun getLogoIconName self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLogoIconName_ self
    fun getProgramName self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getProgramName_ self
    fun getTranslatorCredits self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTranslatorCredits_ self
    fun getVersion self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getVersion_ self
    fun getWebsite self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWebsite_ self
    fun getWebsiteLabel self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWebsiteLabel_ self
    fun getWrapLicense self = (GtkAboutDialogClass.FFI.withPtr false ---> GBool.FFI.fromVal) getWrapLicense_ self
    fun setArtists self artists = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setArtists_ (self & artists)
    fun setAuthors self authors = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setAuthors_ (self & authors)
    fun setComments self comments = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setComments_ (self & comments)
    fun setCopyright self copyright = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setCopyright_ (self & copyright)
    fun setDocumenters self documenters = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setDocumenters_ (self & documenters)
    fun setLicense self license = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLicense_ (self & license)
    fun setLicenseType self licenseType = (GtkAboutDialogClass.FFI.withPtr false &&&> GtkLicense.FFI.withVal ---> I) setLicenseType_ (self & licenseType)
    fun setLogo self logo = (GtkAboutDialogClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setLogo_ (self & logo)
    fun setLogoIconName self iconName = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLogoIconName_ (self & iconName)
    fun setProgramName self name = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setProgramName_ (self & name)
    fun setTranslatorCredits self translatorCredits = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTranslatorCredits_ (self & translatorCredits)
    fun setVersion self version = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setVersion_ (self & version)
    fun setWebsite self website = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setWebsite_ (self & website)
    fun setWebsiteLabel self websiteLabel = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWebsiteLabel_ (self & websiteLabel)
    fun setWrapLicense self wrapLicense = (GtkAboutDialogClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setWrapLicense_ (self & wrapLicense)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (get 0w1 string ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val commentsProp =
        {
          name = "comments",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val copyrightProp =
        {
          name = "copyright",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val licenseProp =
        {
          name = "license",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val licenseTypeProp =
        {
          name = "license-type",
          gtype = fn () => C.gtype GtkLicense.t (),
          get = fn x => fn () => C.get GtkLicense.t x,
          set = fn x => C.set GtkLicense.t x,
          init = fn x => C.set GtkLicense.t x
        }
      val logoProp =
        {
          name = "logo",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val logoIconNameProp =
        {
          name = "logo-icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val programNameProp =
        {
          name = "program-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val translatorCreditsProp =
        {
          name = "translator-credits",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val versionProp =
        {
          name = "version",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val websiteProp =
        {
          name = "website",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val websiteLabelProp =
        {
          name = "website-label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val wrapLicenseProp =
        {
          name = "wrap-license",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
