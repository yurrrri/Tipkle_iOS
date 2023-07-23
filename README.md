# 🍯 팁끌

## 프로젝트 소개

일상생활에서 본인이 알고 있는 꿀팁을 공유하는 앱 서비스
- 기간 : 2021.11 ~ 2022.02
- 역할 : iOS 개발 100%
- 팀 구성: Android/iOS 개발자 1명, 백엔드 개발자 1명, 디자이너 1명, PM 1명

## Tech Stack

-   **언어**  : Swift
-   **UI**: UIKit, Storyboard
-   **네트워킹**  : Alamofire
-   **기타**: Kakao Login sdk
-   **협업**  : Figma


## Experience
-   팀원의 의사로 서버를 더이상 운영하지 않아 서비스를 배포 뿐만 아니라 이후 개선 및 운영하지 못했던 점에서 아쉬움이 남았음
    -   이후 진행하는 프로젝트는 버그 수정 및 기능 개선을 진행 중
-   UICollectionView Cell 안에 UICollectionView가 포함된 **중첩 UICollectionView**를 구현하였으며, **cell의 재사용성으로 인한 이미지 이슈를 인지하고 이에 대해 해결할 수 있었음**
-   카카오 로그인 sdk를 사용하여 **SNS 로그인을 구현**하고, SNS 로그인 성공 시 발급되는 Oauth Token 및 **Jwt**를 통해 자동 로그인 및 토큰 갱신 로직 구현
-   요구사항을 분석하여 UIViewController의 공통 속성들을 **BaseViewController**로 묶어 재사용성을 높이기 위한 방법을 고민하고 활용하였음
    -   공통적인 속성 : 상태바, 배경, 왼쪽으로 스와이프 시 pop ViewController 메소드 등

## 스크린샷
<img width="800" alt="Untitled (23)" src="https://github.com/runner-be/RunnerBe-iOS/assets/37764504/78a29f96-b786-4936-a35c-b39a13d85b64">
