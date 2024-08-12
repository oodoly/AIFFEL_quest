# 리뷰어: 이한나
🔑 **PRT(Peer Review Template)**

- [v ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 기능이 정상적으로 작동하는지?
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부  
        - 코드 리뷰하며 앱이 정상작동 되는 부분과 api 결과 호출 값이 잘 받아 오는 것을 확인했습니다.  
      
- [v ]  **2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation/markdown이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다. 
        - api 구성 중 서버 구성 부분과 api 구성 부분등이 주석이 잘 처리되어있습니다.
          
                   # Run the server
                    if __name__ == "__main__":
                        uvicorn.run("server_fastapi_vgg16:app",
                                reload= True,   # Reload the server when code changes
                                host="127.0.0.1",   # Listen on localhost 
                                port=5000,   # Listen on port 5000 
                                log_level="info"   # Log level
                                )
- [ v]  **3.** 에러가 난 부분을 디버깅하여 “문제를 해결한 기”을 남겼나요? 또는
   “새로운 시도 및 추가 실험”을 해봤나요? ****
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.  
        - 앱을 구성하는 부분에서 이미지를 불러오고 debug console 깔끔하게 결과값을 나눠 보여주었습니다.  
      
                       void _onLeftButtonPressed() async {
                        // 이미지를 불러와서 인퍼런스하고 출력값을 콘솔에 출력하는 코드 추가
                        String url = '9a6a-124-56-101-127.ngrok-free.app';
                        Uri uri = Uri.https(url, '/label');
                        var response = await http.get(uri);
                        final result = jsonDecode(response.body)['predicted_label'];
                        print('예측 결과 : $result 클래스'); // print('예측 결과 : ${} 클래스');
                      }
                    
                      void _onRightButtonPressed() async {
                        String url = '9a6a-124-56-101-127.ngrok-free.app';
                        Uri uri = Uri.https(url, '/score');
                        var response = await http.get(uri);
                        final result = jsonDecode(response.body)['predicted_score'];
                        print('$result 확률로 예측했습니다.'); // print('${} 확률로 예측했습니다.');
                      }
        
- [ v]  **4. 회고를 잘 작성했나요?**
    - 프로젝트 결과물에 대해 배운점과 아쉬운점, 느낀점 등이 상세히 기록 되어 있나요?
    - README.md 파일에 회고가 잘 작성되었습니다.  

- [v ]  **5. 코드가 간결하고 효율적인가요?**
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.  
        - 코드가 간결하고 직관적입니다.    
