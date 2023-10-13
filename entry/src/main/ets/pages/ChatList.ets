import router from '@ohos.router'
import App from '@system.app';
import ChatData from '../model/ChatData'
import { AppColors } from '../model/common';

@Component
export default struct ChatList {
  @Link private userName: string
  @Consume private chats: Array<ChatData>

  build() {
    List() {
      ForEach(this.chats.filter(item => (item.name === this.userName)), item => {
        ListItem() {
          ChatListItem({ chatItem: item })
        }
      }, item => item.id.toString())
    }.margin({top: 10})
  }
}

@Component
struct ChatListItem {
  private chatItem: ChatData
  build() {
    Column() {
      if(this.chatItem.type == 'received') {
        Row() {
          Text(this.chatItem.message)
            .fontSize(14)
            .textAlign(TextAlign.Start)
            .align(Alignment.End)
            .backgroundColor(Color.White)
            .padding(12)
        }
        .width('60%')
        .alignSelf(ItemAlign.Start)
        .margin({left: 15, right: 10})
      } else {
        Row() {
          Column() {
            Text(this.chatItem.message)
              .fontSize(14)
              .textAlign(TextAlign.End)
              .backgroundColor(AppColors.chatSendBackground)
              .fontColor(AppColors.chatSendText)
              .padding(12)
          }
          .width('60%')
          .alignItems(HorizontalAlign.End)
        }

        .alignSelf(ItemAlign.End)
        .margin({right: 15})
      }
    }
    .height(64)
    .width('100%')
  }
}
