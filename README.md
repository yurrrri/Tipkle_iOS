# 🍯 팁끌

## 프로젝트 소개

일상생활에서 본인이 알고 있는 꿀팁을 공유하는 앱 서비스
- 기간 : 2021.11 ~ 2022.02
- 역할 : Android, iOS 개발 100%
- 팀 구성: Android/iOS 개발자 1명, 백엔드 개발자 1명, 디자이너 1명, PM 1명

## Tech Stack

-   **언어**: Swift
-   **UI**: UIKit, Storyboard
-   **네트워킹**: Alamofire
-   **기타**: Kakao Login sdk
-   **협업**: Figma

## 아키텍처
### MVC
<img width="500" src="https://github.com/yurrrri/Tipkle_iOS/assets/37764504/86eeb8a7-6df1-4cef-b905-79a76a3f974e"/> <br/>

- **App**: Constant(앱 전반적으로 쓰이는 상수를 모은 구조체)
- **Common**: 앱 공통적으로 쓰이는 Indicator View, 프로젝트 개발 시 유용한 코드를 모은 Util 폴더, 자주 사용하는 메소드를 extension으로 정의하여 모듈화
- **Base**: 앱의 ViewController, TabbarController, 서버 response에 공통적으로 사용되는 속성을 정의하며, Feature의 각 요소는 해당 Base 클래스를 상속하여 재사용성을 높임
- **Feature**: 초기 카카오 로그인 화면 / 탭바 기준으로 Home, Tipkle, Search, MyPage로 분리
  - 각 Feature는 ViewController, DataManager를 소유함
  - **ViewController**: 화면 별 ViewController로, 각각 xib 파일을 소유하며 해당 뷰를 보여주고, DataManager의 API 호출에 의존하여 UI 반영
  - **DataManager**: Alamofire를 활용하여 네트워크 통신한 결과를 viewController의 메소드로 전달

## 스크린샷
<img width="800" alt="Untitled (23)" src="https://github.com/runner-be/RunnerBe-iOS/assets/37764504/78a29f96-b786-4936-a35c-b39a13d85b64">
