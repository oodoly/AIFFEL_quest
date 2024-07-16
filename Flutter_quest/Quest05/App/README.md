* pubspec.yaml
* lib/main.dart
* assets/image/jellyfish.jpg
* server/
  * server_fastapi_vgg16.py
  * vgg16_prediction_model.py
  * (vgg16.h5)
  * __pychche__/
    * server_fastapi_vgg16.cpython-310.pyc
    * vgg16_prediction_model.cpython-310.pyc


**회고**

__배운점__

* 파이썬으로 구성된 API를 통해서 데이터를 받아 플러터로 앱을 구성하는 프로젝트였습니다. API가 데이터를 받아오는 기능이라는 걸 확인할 수 있었습니다. 데이터만 API를 통해서 받아오면 되기에, 받아온 데이터로 UI를 구성하는 건 어느 프레임워크를 사용하든 무관했습니다.
* 다만 플러터에서 API로 받은 데이터를 읽어와 표시하려면 해 줘야 하는 작업들이 있었습니다 (Flutlab으로 API 내용을 확인할 때와 다른 부분)
  * 비동기처리
  * URL 처리
  * http로 받은 문자열 jsonDecode로 처리

__느낀점__
* 선웅님이 서버 및 API 데이터를 플러터로 불러오는 부분을 마법처럼 구현해주셨습니다. 정말 신기했고 API 기능의 전체적인 흐름도 설명해주셔서 잘 알아들을 수 있었습니다. 플러터 앱 화면 구성과 API 다루는 부분으로 나누어 퀘스트를 진행했는데, 메인 화면 자체에서도 가장 중요했던 부분은 uri 클래스를 사용한 http 주소 받기였던 것 같아 감사할뿐입니다.
* 더 구체적으로 앱을 뜯어보지 못한 게 아쉽습니다. 똑똑하게 질문하기 위해서 꾸준히 공부하려고합니다

* 서버에 대해서 살펴볼수록 질문이 늘어납니다
  * logger의 정체
  * 미들웨어 사용법
