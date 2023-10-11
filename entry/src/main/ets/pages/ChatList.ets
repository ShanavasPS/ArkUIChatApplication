import router from '@ohos.router'
import ChatData from '../model/ChatData'
import ChatDataSource from '../model/ChatDataModel'

@Component
export default struct ChatList {
  @Prop private userName: string
  @Consume private chats: Array<ChatData>

  build() {
    List() {
      ForEach(this.chats.filter(item => (item.name === this.userName)), item => {
        ListItem() {
          ChatListItem({ chatItem: item })
        }
      }, item => item.id.toString())
    }
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
            .backgroundColor(Color.Blue)
        }
        .alignSelf(ItemAlign.Start)
        .margin({left: 10})
      } else {
        Row() {
          Text(this.chatItem.message)
            .fontSize(14)
            .textAlign(TextAlign.End)
            .backgroundColor(Color.Green)
        }
        .alignSelf(ItemAlign.End)
        .margin({right: 10})
      }
    }
    .height(64)
    .width('100%')
    .margin({top: 10})
  }
}
