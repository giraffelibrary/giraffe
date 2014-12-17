structure GtkAboutDialog :>
  GTK_ABOUT_DIALOG
    where type 'a class_t = 'a GtkAboutDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type license_t = GtkLicense.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_about_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_about_dialog_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getComments_ = call (load_sym libgtk "gtk_about_dialog_get_comments") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getCopyright_ = call (load_sym libgtk "gtk_about_dialog_get_copyright") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLicense_ = call (load_sym libgtk "gtk_about_dialog_get_license") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLicenseType_ = call (load_sym libgtk "gtk_about_dialog_get_license_type") (GObjectObjectClass.PolyML.PTR --> GtkLicense.PolyML.VAL)
      val getLogo_ = call (load_sym libgtk "gtk_about_dialog_get_logo") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getLogoIconName_ = call (load_sym libgtk "gtk_about_dialog_get_logo_icon_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getProgramName_ = call (load_sym libgtk "gtk_about_dialog_get_program_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getTranslatorCredits_ = call (load_sym libgtk "gtk_about_dialog_get_translator_credits") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getVersion_ = call (load_sym libgtk "gtk_about_dialog_get_version") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getWebsite_ = call (load_sym libgtk "gtk_about_dialog_get_website") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getWebsiteLabel_ = call (load_sym libgtk "gtk_about_dialog_get_website_label") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getWrapLicense_ = call (load_sym libgtk "gtk_about_dialog_get_wrap_license") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setComments_ = call (load_sym libgtk "gtk_about_dialog_set_comments") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setCopyright_ = call (load_sym libgtk "gtk_about_dialog_set_copyright") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setLicense_ = call (load_sym libgtk "gtk_about_dialog_set_license") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setLicenseType_ = call (load_sym libgtk "gtk_about_dialog_set_license_type") (GObjectObjectClass.PolyML.PTR &&> GtkLicense.PolyML.VAL --> FFI.PolyML.VOID)
      val setLogo_ = call (load_sym libgtk "gtk_about_dialog_set_logo") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setLogoIconName_ = call (load_sym libgtk "gtk_about_dialog_set_logo_icon_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setProgramName_ = call (load_sym libgtk "gtk_about_dialog_set_program_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setTranslatorCredits_ = call (load_sym libgtk "gtk_about_dialog_set_translator_credits") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setVersion_ = call (load_sym libgtk "gtk_about_dialog_set_version") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setWebsite_ = call (load_sym libgtk "gtk_about_dialog_set_website") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setWebsiteLabel_ = call (load_sym libgtk "gtk_about_dialog_set_website_label") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setWrapLicense_ = call (load_sym libgtk "gtk_about_dialog_set_wrap_license") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAboutDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type license_t = GtkLicense.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAboutDialogClass.C.fromPtr false) new_ ()
    fun getComments self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getComments_ self
    fun getCopyright self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCopyright_ self
    fun getLicense self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLicense_ self
    fun getLicenseType self = (GObjectObjectClass.C.withPtr ---> GtkLicense.C.fromVal) getLicenseType_ self
    fun getLogo self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getLogo_ self
    fun getLogoIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLogoIconName_ self
    fun getProgramName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getProgramName_ self
    fun getTranslatorCredits self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTranslatorCredits_ self
    fun getVersion self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getVersion_ self
    fun getWebsite self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWebsite_ self
    fun getWebsiteLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWebsiteLabel_ self
    fun getWrapLicense self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getWrapLicense_ self
    fun setComments self comments = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setComments_ (self & comments)
    fun setCopyright self copyright = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setCopyright_ (self & copyright)
    fun setLicense self license = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setLicense_ (self & license)
    fun setLicenseType self licenseType = (GObjectObjectClass.C.withPtr &&&> GtkLicense.C.withVal ---> I) setLicenseType_ (self & licenseType)
    fun setLogo self logo = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setLogo_ (self & logo)
    fun setLogoIconName self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setLogoIconName_ (self & iconName)
    fun setProgramName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setProgramName_ (self & name)
    fun setTranslatorCredits self translatorCredits = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setTranslatorCredits_ (self & translatorCredits)
    fun setVersion self version = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setVersion_ (self & version)
    fun setWebsite self website = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setWebsite_ (self & website)
    fun setWebsiteLabel self websiteLabel = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setWebsiteLabel_ (self & websiteLabel)
    fun setWrapLicense self wrapLicense = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setWrapLicense_ (self & wrapLicense)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (get 0w1 string ---> ret boolean) f
    end
    local
      open Property
    in
      val commentsProp =
        {
          get = fn x => get "comments" stringOpt x,
          set = fn x => set "comments" stringOpt x
        }
      val copyrightProp =
        {
          get = fn x => get "copyright" stringOpt x,
          set = fn x => set "copyright" stringOpt x
        }
      val licenseProp =
        {
          get = fn x => get "license" stringOpt x,
          set = fn x => set "license" stringOpt x
        }
      val licenseTypeProp =
        {
          get = fn x => get "license-type" GtkLicense.t x,
          set = fn x => set "license-type" GtkLicense.t x
        }
      val logoProp =
        {
          get = fn x => get "logo" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "logo" GdkPixbufPixbufClass.tOpt x
        }
      val logoIconNameProp =
        {
          get = fn x => get "logo-icon-name" stringOpt x,
          set = fn x => set "logo-icon-name" stringOpt x
        }
      val programNameProp =
        {
          get = fn x => get "program-name" stringOpt x,
          set = fn x => set "program-name" stringOpt x
        }
      val translatorCreditsProp =
        {
          get = fn x => get "translator-credits" stringOpt x,
          set = fn x => set "translator-credits" stringOpt x
        }
      val versionProp =
        {
          get = fn x => get "version" stringOpt x,
          set = fn x => set "version" stringOpt x
        }
      val websiteProp =
        {
          get = fn x => get "website" stringOpt x,
          set = fn x => set "website" stringOpt x
        }
      val websiteLabelProp =
        {
          get = fn x => get "website-label" stringOpt x,
          set = fn x => set "website-label" stringOpt x
        }
      val wrapLicenseProp =
        {
          get = fn x => get "wrap-license" boolean x,
          set = fn x => set "wrap-license" boolean x
        }
    end
  end
