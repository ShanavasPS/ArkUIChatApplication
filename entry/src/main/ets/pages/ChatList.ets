import router from '@ohos.router'
import ChatData from '../model/ChatData'
import { initializeOnStartup } from '../model/ChatDataModel'

@Entry
@Component
export default struct ChatList {
  private chatItems: ChatData[] = initializeOnStartup()
  private userName: string

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
      Text(this.chatItem.name)
        .fontSize(14)
        .flexGrow(1)
      Text(this.chatItem.message)
        .fontSize(14)
    }
    .height(64)
    .margin({ right: 24, left:32 })
  }
}
