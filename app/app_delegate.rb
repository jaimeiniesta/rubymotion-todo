class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    NanoStore.shared_store = NanoStore.store(:file, documents_path + "/nano-todo.db")

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = ItemsController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
