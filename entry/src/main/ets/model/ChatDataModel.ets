import ChatData from './ChatData';

export default class ChatDataSource {
  private dataArray: Array<ChatData> = []

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'username': 'shanavas.shaji', 'message': 'Hi, there', 'time': 'Some time', 'type': 'received' },
    { 'name': 'Victoria Maslova', 'username': 'victoria.maslova', 'message': 'Hi, there', 'category': 'Some other time', 'type': 'received' },
    { 'name': 'Shanavas Shaji', 'username': 'shanavas.shaji', 'message': 'How are you?', 'time': 'Some time', 'type': 'received' },
    { 'name': 'Alexey Smolyaninov', 'username': 'alexey.smolyaninov', 'message': 'How are you?', 'category': 'Some other time', 'type': 'received' }
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

