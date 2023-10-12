// Second.ets
import router from '@ohos.router';
import UserData from '../model/UserData';
import ChatList from './ChatList';
import ChatDataSource from '../model/ChatDataModel'
import ChatData from '../model/ChatData'

@Entry
@Component
struct ChatScreen {

  controller: TextInputController = new TextInputController()
  @State message: string = ''

  datasource: ChatDataSource = new ChatDataSource()
  @Provide chats: Array<ChatData> = this.datasource.getData()

  // @ts-ignore
  private userData: UserData = router.getParams().userData
  @State userName:string = this.userData.name

  private sendMessage(message: string) {
    this.datasource.addMessage(this.userData.name, message, "some time");
    this.chats = this.datasource.getData()
  }

  build() {
    Row() {
      Column() {
        PageTitle({userName: this.userName})
        ChatList({userName: this.userName})
          .height('80%')
          .backgroundColor(Color.Gray)
        Row() {
          TextInput({ text: this.message, placeholder: 'search...' })
            .width('80%')
            .height(40)
            .backgroundColor('#FFFFFF')
            .onChange((value: string) => {
              this.message = value
            })
          Button() {
            Text('Send')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
            }
            .onClick(() => {
              if(this.message.length != 0) {
                this.sendMessage(this.message)
              }
            })
           .margin({left: 10})
        }.margin({top: 10})
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Green)
    .alignItems(VerticalAlign.Top)
  }
}

@Component
struct PageTitle {
  @Prop private userName: string

  build() {
    Row() {
      Image($r('app.media.backArrow'))
        .width(21.8)
        .height(19.6)
      Text(this.userName)
        .fontSize(21.8)
        .margin({left: 10})
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
    }
    .alignSelf(ItemAlign.Start)
    .height(61)
    .margin({top: 36, left: 14})
    .onClick(() => {
      router.back()
    })
  }
}

