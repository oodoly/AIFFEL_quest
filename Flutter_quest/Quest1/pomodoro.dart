/* Pomodoro 타이머를 만들어보자!

: 플러터 라이브러리를 탐색하고 채택해 원하는 형태로 코딩 및 출력해보자

총 4회차 (반복되는 최소 단위)
    1~3회차: 25분 작업, 5분 휴식
    4회차  : 25분 작업, 15분 휴식
참고: Timer.periodic 
https://api.flutter.dev/flutter/dart-async/Timer/Timer.periodic.html
https://api.flutter.dev/flutter/dart-async/Timer-class.html
* dart:async 라이브러리 속 Timer 클래스

Task: 아래와 같이 출력
flutter: Pomodoro 타이머를 시작합니다.
flutter: 24:59 .... (1초마다 시간 프린트)
flutter: 작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.

그 외:
타이머 위키독스
https://wikidocs.net/168330
Dart 공식문서의 Stopwatch
https://api.dart.dev/stable/3.4.4/dart-core/Stopwatch-class.html

*/

/* 알아보자

// dart:async 라이브러리 속 타이머 이용하기
import 'dart:async';

void main(){

  Future.delayed(const Duration(seconds: 2), () {
    print('passed 2 sec.');  // 2초 후 출력
  });
  // Connecting to VM Service at ws://127.0.0.1:56647/98I2GZ8Gn3g=/ws
  // passed 2 sec.

  Timer.periodic(Duration(seconds: 5), (timer) {
      print(DateTime.now()); 
  });
  // 2024-07-02 16:11:40.640765
  // 2024-07-02 16:11:45.637861
  // 2024-07-02 16:11:50.637372
  // 2024-07-02 16:11:55.637391
  // 이렇게 5초마다 출력

  Timer t = Timer(Duration(seconds: 1), () {
    print('passed 2 sec'); // 출력 안 됨
  });
  t.cancel();  // 곧바로 취소되어 출력 안 됨

}
*/

// 클래스 구현해보자

//Timer Pomodoro = Timer...
import 'dart:async';

class PomodoroTimer {
  final int workDuration = 25 * 60; // 초단위가 기본이어서 60을 곱해서 분으로 셋팅
  final int shortBreakDuration = 5 * 60; // 짧은 휴식
  final int longBreakDuration = 15 * 60; // 긴 휴식
  final int cyclesBeforeLongBreak = 4; // 4번째 사이클에서는 15분 휴식을 하도록 함

  int _currentCycle = 0; // 사이클 횟수 계산해주는 변수
  bool _isWorking = true; 
  Timer? _timer;
  int _secondsRemaining = 0;

  void start() {
    _startWork();
  }

  void _startWork() {
    _isWorking = true;
    _secondsRemaining = workDuration; // 작업 시간을 타이머에 넣어줌
    print('Pomodoro 타이머를 시작합니다.');
    _startTimer();
  }

  void _startShortBreak() {
    _isWorking = false;
    _secondsRemaining = shortBreakDuration; // 짧은 휴식 시간을 타이머에 넣어줌
		print('작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
    _startTimer();
  }

  void _startLongBreak() {
    _isWorking = false;
    _secondsRemaining = longBreakDuration; // 긴 휴식 시간을 타이머에 넣어줌
    print('작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) { // Duration 모듈, 1초마다 실행
      if (_secondsRemaining > 0) { // 남은 시간이 0 이상이면 계속 경과 시간 프린트
        _secondsRemaining--;
        _printTime(); // 프린트타임 함수로 출력
      } else {
	      
        _timer?.cancel(); // 남은 시간이 0이 되면, 타이머 중단, 사이클 카운팅 실행
        if (_isWorking) {
          _currentCycle++;
          if (_currentCycle % cyclesBeforeLongBreak == 0) { // 4번째 사이클이면 긴 휴식 작동
            _startLongBreak();
          } else {
            _startShortBreak(); // 그 외에는 짧은 휴식 작동
          }
        } else {
          _startWork(); // 휴식이 끝나면 다시 작업 시작
        }
      }
    });
  }

  void _printTime() {
    int minutes = _secondsRemaining ~/ 60; // 남은 시간을 60으로 나눠서 소수점을 버리고 정수로 출력
    int seconds = _secondsRemaining % 60; // 남은 시간을 60으로 나눠서 나머지만 출력
    print('${_isWorking ? "Work" : "Break"} Time: $minutes:${seconds.toString().padLeft(2, '0')}');
  }

  void stop() {
    _timer?.cancel();
    print("타이머가 종료되었습니다.");
  }
}

void main() {
  PomodoroTimer pomodoroTimer = PomodoroTimer();
  pomodoroTimer.start();
}


/*
회고
김재이:
* 플러터 라이브러리 안의 다양한 클래스 중에서 Timer 클래스와 그 안의 메서드들을 알게됐습니다.
* 포맷팅을 따로 함수로 구현한 것이 전체적인 코드작성이나 가독성에 모두 효율적이었던 것 같습니다.
* 처음 태스크를 받았을 때에는 반복문만 강하게 떠올렸는데, 모듈화에 더 익숙해져야겠습니다. 모듈화하면 논리적으로 설명하기가 훨씬 쉬워지고, 코드도 효율적이어진다고 느꼈습니다.
*/
