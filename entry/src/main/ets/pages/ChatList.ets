import router from '@ohos.router'
import ChatData from '../model/ChatData'
import ChatDataSource from '../model/ChatDataModel'

@Component
export default struct ChatList {
  @Prop private userName: string
  @Prop private chatItems: ChatData[]

  build() {
    List() {
      ForEach(this.chatItems.filter(item => (item.name === this.userName)), item => {
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
    Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
      Text(this.chatItem.message)
        .fontSize(14)
    }
    .height(64)
    .margin({ right: 24, left:32 })
  }
}
