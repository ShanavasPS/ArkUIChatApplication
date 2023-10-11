
let NextId = 0;
export default class ChatData {
  id: string;
  name: string;
  message: string;
  time: string;
  type: string;

  constructor(name: string, message: string, time: string, type: string) {
    this.id = `${ NextId++ }`;
    this.name = name;
    this.message = message;
    this.time = time;
    this.type = type;
  }
}