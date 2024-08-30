
# 이미지 세그멘테이션

## 주제 : 의료영상 U-Net 용종검출

Models:
* Sequantial Model API로 구현하는 Encoder-Decoder model (Part1)
* Functional API로 구현하는 U-Net model (Part1)
* U-Net + Pretrained VGG16 (Part2 VGG16)
* U-Net + Pretrained ResNet50 (Part2 ResNet50)

---

학습목표

* 위내시경 이미지에 용종을 표시한 데이터를 이용해 모델을 구성하고, 용종을 찾는 Segmentation 모델을 만들어 본다.
* 의료이미지 특성상 수가 적은 데이터셋을 활용하기 위한 Data augmentation을 진행해 본다.
* Encoder-Decoder Model과 U-net 모델을 구현해 보고, U-Net이 일반 Encoder-Decoder 모델 대비 어느정도 성능향상이 되는지 확인해 본다.
* U-Net에 pretrained encoder를 적용하여 성능개선을 확인해 본다.

---

완성 현황:

의료영상 데이터의 전처리 및 augmentation을 위한 파이프라인 구성이 체계적으로 진행되었는가?

[o] augmentation이 반영된 tf.data.Dataset 구성이 정상적으로 진행되었다.

U-Net의 개선 모델을 구현하여 적용 후 기존 U-Net 대비 성능 개선을 확인하였는가?

[3/3 진행중] U-Net 개선 모델의 학습 과정이 정상적으로 진행되었으며, validation meanIoU가 기존 U-Net보다 좋아짐 을 확인하였다.

3가지 모델에 대한 학습과정, 테스트 결과를 체계적으로 비교분석하였는가?

[3/3 진행중] loss 그래프, meanIoU 계산, segmentation 결과 시각화 등이 3가지 모델에 대해 수행된 후 결과 비교분석 이 제시되었다.

---

Part 1 회고:

Encoder-Decoder 모델 대비 U-Net의 세그멘테이션 성능을 비교해봤다.
meanIoU 값도 각각 0.68, 0.94로 같은 데이터에 대하여 큰 성능 차이를 보여주었고, 육안으로도 차이를 관찰 가능했다.

Part 2 회고:

조합된 모델을 구현은 가능했지만 성능은 기존 U-Net에 못 미치는 상태로 제출 시점 기준 미션 달성은 실패이고 실험 진행중이다.
