class AppDelegate

  def application application, didFinishLaunchingWithOptions: launchOptions
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @controller = UIViewController.alloc.initWithNibName(nil, bundle:nil)

    @window.rootViewController = @controller
    @window.makeKeyAndVisible

    @label = UILabel.alloc.initWithFrame [ [10,10], [300,100] ]
    @label.setAccessibilityLabel 'username'
    @label.setText '...'
    @controller.view.addSubview @label

    Facebook.app_id = NSBundle.mainBundle.objectForInfoDictionaryKey('APP_ID')
    Facebook.sign_in do |granted, error|
      if granted
        @label.setText Facebook.accounts[0].username
      else
        puts error.code
        puts error.localizedDescription
        puts error.localizedRecoveryOptions
        puts error.localizedRecoverySuggestion
        @label.setText 'Fail... See Log'
      end
    end

    true
  end
end
