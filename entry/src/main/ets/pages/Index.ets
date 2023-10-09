import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State subText: string = 'How are you?';
  @State text: string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Row() {
      Column() {
        TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
          .placeholderFont({ size: 14, weight: 400 })
          .width(320).height(40).offset({y: 0})
          .fontSize(14).fontColor(Color.Black)
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            this.text = value
          })
        Text(this.text)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text(this.subText)
          .fontSize(25)
          .fontColor(Color.White)
        Button() {
          Text('Next')
            .fontSize(30)
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
            router.pushUrl({ url: 'pages/second' })
          })
        Image($r('app.media.icon'))
          .width(110).height(110).margin(15)
          .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($r('app.media.leaf'))
          .width(110).height(110).margin(15)
          .overlay('gif', { align: Alignment.Bottom, offset: { x: 0, y: 0 } })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Green)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}