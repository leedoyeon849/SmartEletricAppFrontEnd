# ⚡️ 스마트 전기앱
<img width="1532" alt="Screenshot 2023-06-03 at 10 59 07 PM" src="https://github.com/leedoyeon849/SmartEletricAppFrontEnd/assets/71880682/999f3440-c082-4634-bd52-a31ec976e1db">

- 랜딩페이지: https://dodo849.github.io/SmartEletricAppFrontEnd/

> 스마트 전기앱은 한국전력공사 API를 이용한 모바일 어플리케이션입니다.

> 실시간 전기 사용량 확인, 전기 요금 예측, 전기 사용량 리포트, 전기 요금 시뮬레이션 기능을 제공합니다.

### 팀
이름 | 역할
---|---
김진연 |백엔드, 인프라
안정수 | 백엔드, 인프라
이도연 | 프론트엔드(Flutter, Web)
### 소속
- 소프트웨어마에스트로 13기 (2022)


## 🌱 Git commit convention

- [Feat] : 새로운 기능
- [Fix] : 오류 수정
- [Refac] : 리팩토링
- [Docs] : 문서/주석 수정
- [Test] : 테스트 코드 작성 및 수정
- [Minor] : 자잘한 UI 수정 및 코드 정리
- [Other] : 기타 작업

- 두 줄 띄고 상세사항/남은사항 본문으로 작성


## 💡 Design pattern

### [UI] Atomic 디자인패턴을 변형하여 적용해 UI 컴포넌트를 atom, module, page로 구분했습니다.

- **atom**: 전 페이지에서 재사용가능한 최소 단위의 컴포넌트를 정의합니다.
  - 주로 스타일링된 버튼과 사용자 Input 필드가 포함됩니다.

- **module**: atom과 다른 module을 조합해 정보 집합을 만듭니다.
  - 카드뷰, 리스트뷰가 포함됩니다.

- **page**: atom과 module을 조합하고 레이아웃을 지정합니다.
  - moudule간의 여백을 조정도 담당합니다.


### [Business Logic] Clean Architecture+MVVM을 적용했습니다.

- 3계층 구조: Data, Domain, Presentation
1. **Data layer**
  - Repository 패턴을 이용하여 서버와 DB 접근을 추상화합니다.
  - 서버 스키마 매핑을 위한 DTO도 포함됩니다.
2. **Domain layer**
  -  의존을 위한 Repository interface와 UseCase가 포함됩니다. 
  -  UseCase는 Repository를 조합해 유저 시나리오에 따른 흐름을 구성합니다.
3. **Presentation layer(MVVM)**
  - View(UI)와 ViewModel으로 구성됩니다.
  - View에서 ViewModel을 주입받고 ViewModel에서 UseCase를 호출하여 View에 바인딩된 변수를 변경합니다.


## 📘 Library
**라이브러리명** | **용도**
---|---
GetX | 상태관리
Dio | 네트워킹
freezed | DTO 코드 제너레이터
fl_chart | 그래프
get_it | DI



