피어리뷰
# AIFFEL Campus Code Peer Review Templete
- 코더 : 김재이
- 리뷰어 : 유제민

🔑 **PRT(Peer Review Template)**

- [ㅇ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 기능이 정상적으로 작동하는지?
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부
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
  25분 일하고 5분 또는 15분 휴식의 조건을 만족하는 코드입니다.

    
- [ㅇ]  **2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation/markdown이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
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
  각 코드마다 기능에 대한 설명이 잘 적혀있습니다.

- [ ]  **3.** 에러가 난 부분을 디버깅하여 “문제를 해결한 기록”을 남겼나요? 또는
   “새로운 시도 및 추가 실험”을 해봤나요? ****
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
        
- [ㅇ]  **4. 회고를 잘 작성했나요?**
    - 프로젝트 결과물에 대해 배운점과 아쉬운점, 느낀점 등이 상세히 기록 되어 있나요?
    - 네 플러터의 Timer 클래스와 그 안의 메서드들을 알게되었으며, 모듈화에 대한 느낀점이 적혀있습니다.

- [ㅇ]  **5. 코드가 간결하고 효율적인가요?**
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
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

작업 시간과 짧게 쉬는 시간, 길게 쉬는 시간 각각 나눠져서 모듈화 되어 있습니다.
