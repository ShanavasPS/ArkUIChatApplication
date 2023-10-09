import router from '@ohos.router';

@Entry
@Component
struct HomeScreen {
  @State message: string = 'Hi username';
  @State subText: string = 'Welcome to Home Screen';
  @State text: string = 'Hi username'
  controller: TextInputController = new TextInputController()

  build() {
    Row() {
      Column() {
        Text(this.text)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text(this.subText)
          .fontSize(25)
          .fontColor(Color.White)

        Button() {
          Text('Logout')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Blue)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}