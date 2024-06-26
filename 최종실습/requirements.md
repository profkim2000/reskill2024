# 요구사항 명세서 만드는 법

클라이언트의 요구사항은 소프트웨어 전체를 관통하는 제일 중요한 요소입니다.  

이 클라이언트의 요구사항 관리가 프로젝트의 성패를 결정하는 중요한 역할을 합니다.

PM의 제일 중요한 역할도 클라이언트의 요구사항을 만족시키는 방향으로 프로젝트가 진행되고 있는지 점검하고 그렇게 되도록 만드는 것입니다. (안 그러면 클라이언트한테서 돈이 안나오니까)

그래서 RFP(제안요청서)를 기준으로 제안서를 만들고,  
내 제안서가 통과되어 내가 그 발주를 따내게 되면(수주)  
과업지시서를 기반으로 RFP를 참조해 가며 요구사항 명세서를 만듭니다.

요구사항 명세서를 만드는 이유는 요구사항을 관리하기 위해서입니다. 

빼뜨리고 지나가고 있는 요구사항은 없는지,  
구현하는데 시간이 오래 걸릴만한 요구사항은 없는지,  
선행되어야 할 요구사항은 없는지,  
클라이언트에게 미리 어떠어떠한 걸 준비해 달라고 요구해서 받은 다음에야 진행할 수 있는 요구사항은 없는지 

등등을 점검하기 위해 만듭니다. (클라이언트는 절대 이런 걸 미리 챙겨주지 않아요)


## 요구사항 명세서 양식

요구사항은 requirements라고 영어로도 많이 부릅니다.  
[요구사항] 혹은 [리콰이어먼츠]라고 많이 불러요.

공식적인 요구사항 명세서 양식은 없습니다.  
개발 업체마다 다 양식이 다른데, 대부분 클라이언트들은 그냥 개발업체 양식대로 받아주는 편입니다.
그래도 필수로 적어넣어야 하는 것들이 있으니 꼭 챙겨 넣어야 합니다.  
안 그러면 클라이언트가 산출물이 부실하다고 돈을 안 주겠죠?

- ID: 주로 REQ로 시작하는 ID를 요구사항마다 하나씩 적습니다. PM이 쓰는 툴들은 이 ID를 기반으로 프로젝트를 관리하거나 추적하는 기능을 가지고 있습니다.
  - 예) REQ01-01 혹은 REQ-0001. ID 정하는 방법 역시 정해진 방법은 없습니다.
- 요구사항명: 요구사항의 제목.
  - 예) 게시판을 제공한다.
- 내용: 요구사항에 대한 상세한 내용을 적습니다. 간단하게가 아니라 상세하게 적어야 합니다. 클라이언트가 한 줄로만 얘기했어도 다시 확인해 보고 길게 자세하게 적어야 합니다.
  - 예) 고객과의 질의응답과 공지사항을 위한 게시판을 제공한다. 게시판에는 댓글 기능이 있어야 하고 댓글은 입력한 날짜의 역순으로 보여줘야 한다.
- 중요도
  - 예) [1, 2, 3, 4, 5] 혹은 [A, B, C, D, E] 혹은 [가, 나, 다, 라, 마] 등. 어떤 경우라도 어떤 게 가장 높은 중요도를 갖는지 명시해야 함.
 
이 외에도 
- 화면이 있는 경우 화면명
- 작성자
- 버전
- 구분: 기능 / 비기능

등을 상황에 맞게 적습니다.
