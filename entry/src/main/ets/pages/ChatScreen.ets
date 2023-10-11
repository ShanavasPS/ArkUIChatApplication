// Second.ets
import router from '@ohos.router';
import UserData from '../model/UserData';
import ChatList from './ChatList';
import ChatDataSource from '../model/ChatDataModel'
import ChatData from '../model/ChatData'

@Entry
@Component
struct ChatScreen {
  // @ts-ignore
  private userData: UserData = router.getParams().userData
  @State message: string = ''

  controller: TextInputController = new TextInputController()

  datasource: ChatDataSource = new ChatDataSource()
  @Provide chats: Array<ChatData> = this.datasource.getData()

  @State userName:string = this.userData.name

  private sendMessage(message: string) {
    this.datasource.addMessage(this.userData.name, message, "some time");
    this.chats = this.datasource.getData()
  }

  build() {
    Row() {
      Column() {
        PageTitle({userName: this.userName})
        ChatList({userName: this.userData.name})
          .height('80%')
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
              this.sendMessage(this.message)
            })
        }
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Orange)
    .alignItems(VerticalAlign.Top)
  }
}

@Component
struct PageTitle {
  @Prop private userName: string

  build() {
    Flex({ alignItems: ItemAlign.Start }) {
      Image($r('app.media.app_icon'))
        .width(21.8)
        .height(19.6)
      Text(this.userName)
        .fontSize(21.8)
        .margin({left: 17.4})
        .align(Alignment.Center)
        .textAlign(TextAlign.Center)
    }
    .height(61)
    .margin({top: 36})
    .padding({ top: 13, bottom: 15, left: 28.3 })
    .backgroundColor(Color.Red)
    .onClick(() => {
      router.back()
    })
  }
}

