import ChatData from './ChatData';

export default class ChatDataSource {
  private dataArray: Array<ChatData> = []

  private initialData: any[] = [
    { 'name': 'user 1', 'message': 'Hi, I am the user 1', 'time': 'Some time' },
    { 'name': 'user 2', 'message': 'Hi, I am user 2', 'category': 'Some other time' },
    { 'name': 'user 1', 'message': 'How are you?', 'time': 'Some time' },
    { 'name': 'user 2', 'message': 'How are you?', 'category': 'Some other time' }
  ]

  constructor() {
    this.initialData.forEach(item => {
      this.dataArray.push(new ChatData(item.name, item.message, item.time));
    })
  }

  public getData(): Array<ChatData> {
    return this.dataArray
  }

  public addMessage(name: string, message: string, time: string) {
    this.dataArray.push(new ChatData(name, message, time));
  }
}

