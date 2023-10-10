import ChatData from './ChatData';

const ChatComposition: any[] = [
  { 'name': 'user 1', 'message': 'Hi, I am user 1', 'time': 'Some time' },
  { 'name': 'user 2', 'message': 'Hi, I am user 2', 'category': 'Some other time' },
  { 'name': 'user 1', 'message': 'How are you?', 'time': 'Some time' },
  { 'name': 'user 2', 'message': 'How are you?', 'category': 'Some other time' }
]

export function initializeOnStartup(): Array<ChatData> {
  let ChatDataArray: Array<ChatData> = []
  ChatComposition.forEach(item => {
    ChatDataArray.push(new ChatData(item.name, item.message, item.time));
  })
  return ChatDataArray;
}

export function addMessage(name: string, message: string): Array<ChatData> {
  let ChatDataArray = initializeOnStartup();
  ChatDataArray.push(new ChatData(name, message, 'Some time'));
  return ChatDataArray;
}