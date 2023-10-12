import ChatData from './ChatData';

export default class ChatDataSource {
  private dataArray: Array<ChatData> = []

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'message': 'Hi, there', 'time': 'Some time', 'type': 'received' },
    { 'name': 'Victoria Maslova', 'message': 'Hi, there', 'category': 'Some other time', 'type': 'received' },
    { 'name': 'Shanavas Shaji', 'message': 'How are you?', 'time': 'Some time', 'type': 'received' },
    { 'name': 'Alexey Smolyaninov', 'message': 'How are you?', 'category': 'Some other time', 'type': 'received' }
  ]

  constructor() {
    this.initialData.forEach(item => {
      this.dataArray.push(new ChatData(item.name, item.message, item.time, item.type));
    })
  }

  public getData(): Array<ChatData> {
    return this.dataArray
  }

  public addMessage(name: string, message: string, time: string) {
    this.dataArray.push(new ChatData(name, message, time, 'send'));
  }
}

