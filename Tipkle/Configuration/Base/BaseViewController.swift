
import UIKit

//모든 뷰컨트롤러에서 공통적으로 들어가는 부분
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .font : UIFont.NotoSans(.medium, size: 16),
//        ]
        // Background Color
        self.view.backgroundColor = .white
    }
}
