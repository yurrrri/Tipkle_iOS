
import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    //탭바에 쓰이는 뷰컨트롤러를 먼저 세팅하고,
    let homeViewController  = HomeViewController()
    let tipkleViewController = TipkleViewController()
    let searchViewcontroller = SearchViewController()
    let myViewController = MyPageViewController()

    //tabbar item 설정
    let homeTabBarItem  = UITabBarItem(title: nil, image: UIImage(named: "icon_home_line"), tag: 0)
    let tipTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_tipkle_line"), tag: 1)
    let searchTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_search_line"), tag: 2)
    let myTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_my_line"), tag: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.selectedIndex = 0 //처음 갔을때 디폴트 뷰컨 세팅
        self.tabBarController?.tabBar.barTintColor = .white
        self.tabBarController?.tabBar.isTranslucent = false
        
        //선택했을때의 tabbar icon 세팅
        homeTabBarItem.selectedImage = UIImage(named: "icon_home_full")
        tipTabBarItem.selectedImage = UIImage(named: "icon_tipkle_color")
        searchTabBarItem.selectedImage = UIImage(named: "icon_search_color")
        myTabBarItem.selectedImage = UIImage(named: "icon_mypage_color")
        
        //navigation controller 세팅
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let tipNavigationController = UINavigationController(rootViewController: tipkleViewController)
        let searchNavigationController = UINavigationController(rootViewController: searchViewcontroller)
        let myNavigationController = UINavigationController(rootViewController: myViewController)
        
        homeNavigationController.navigationBar.isHidden = true //bar hidden
        myNavigationController.navigationBar.isHidden = true
        
        homeNavigationController.tabBarItem  = homeTabBarItem
        tipNavigationController.tabBarItem = tipTabBarItem
        searchNavigationController.tabBarItem = searchTabBarItem
        myNavigationController.tabBarItem = myTabBarItem
        
        self.viewControllers = [homeNavigationController, tipNavigationController,
        searchNavigationController, myNavigationController]
        
        self.delegate = self
    }
}
