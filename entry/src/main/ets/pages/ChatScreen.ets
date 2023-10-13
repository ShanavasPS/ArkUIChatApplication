// ChatScreen.ets
import router from '@ohos.router';
import UserData from '../model/UserData';
import ChatList from './ChatList';
import ChatDataSource from '../model/ChatDataModel'
import ChatData from '../model/ChatData'
import { AppColors } from '../model/common';

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
        PageTitle({userData: this.userData})
        Blank()
          .height(1)
          .width('100%')
          .backgroundColor(AppColors.separator)
        ChatList({userName: this.userName})
          .height('80%')
          .backgroundColor(AppColors.chatBackground)
        Column() {
          Blank()
            .height(1)
            .width('100%')
            .backgroundColor(AppColors.separator)
          Row() {
            TextInput({ text: this.message, placeholder: 'search...' })
              .width('80%')
              .height(40)
              .onChange((value: string) => {
                this.message = value
              })
            Button() {
              Text('Send')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Blue)
            }
            .margin({left: 6})
            .onClick(() => {
              if(this.message.length != 0) {
                this.sendMessage(this.message)
              }
            })
            .backgroundColor(Color.White)
          }
          .margin({top : 8})
        }
        .backgroundColor(AppColors.bottomBar)
      }
      .width('100%')
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
  }
}

@Component
struct PageTitle {
  @Prop private userData: UserData

  build() {
    Column() {
      Row() {
        Image($r('app.media.backArrow'))
          .width(21.8)
          .height(19.6)
        Text(this.userData.name)
          .fontSize(21.8)
          .margin({left: 10})
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
        Blank()
        Image(this.userData.image)
          .width(48)
          .height(48)
          .margin({right: 10})
          .borderRadius(24)
      }.width('100%')
      .margin({top: 36})
      .height(61)
      .onClick(() => {
        router.back()
      })
    }.margin({left: 14, right: 14})
  }
}
